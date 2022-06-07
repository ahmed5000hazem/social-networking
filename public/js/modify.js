var addInterestForm = document.getElementById("add-interest"),
    postCommentForm = document.querySelectorAll(".post-comment-form");

class ErrorHandeler {
    constructor(parentElement, message){
        this.parentElement = parentElement;
        this.message = message;
    }
    createErrorCont(){
        let errorCont = document.createElement("div");
        errorCont.style.fontSize = "12px";
        errorCont.classList.add("alert", "alert-danger");
        errorCont.textContent = this.message;
        return errorCont;
    }
    pushError(errordiv) {
        document.querySelector(".widget.message-handeler").classList.remove("display-none");
        this.parentElement.append(errordiv);
    }
    createSuccessCont(){
        let successCont = document.createElement("div");
        successCont.style.fontSize = "12px";
        successCont.classList.add("alert", "alert-success");
        successCont.textContent = this.message;
        return successCont;
    }
    pushSuccess(successdiv) {
        document.querySelector(".widget.message-handeler").classList.remove("display-none");
        this.parentElement.append(successdiv);
    }
};

function dateHandeler(date) {
    var d = new Date(date);
    
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var hour = d.getHours();
    if (hour > 12) {
        hour = hour - 12 + " PM";
    } else {
        hour = hour + " AM";
    }
    var month = months[d.getMonth()];

    var day = d.getDate();


    return d.getFullYear()+" "+ month + " " + day + " At " + hour;
}

function clearMessages(time = 1000) {
    setTimeout(function () {
        var errorsCont = Array.from(document.querySelector(".widget.message-handeler").children);
        errorsCont.forEach(error => {
            error.remove();
        });
        document.querySelector(".widget.message-handeler").classList.add("display-none");
    }, time);
}

function addInterests () {
    addInterestForm.onsubmit = function (e) {
        e.preventDefault();
        var addInterestInput = document.querySelector("#add-interest input[name=interest]"),
            interestAdded = document.querySelector("#add-interest .interest-added");
        if (addInterestInput.value !== "") {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function (){
                if (this.status == 200 && this.readyState == 4) {
                    var li = document.createElement("li"),
                        href = document.createElement("a"),
                        span = document.createElement("span");
                    
                    href.textContent = addInterestInput.value;
                    span.classList.add("remove");
                    
                    li.append(href);
                    li.append(span);
                    li.setAttribute("data-interest", addInterestInput.value);

                    interestAdded.append(li);

                    addInterestInput.value = "";
                }
            }
            xhr.open("POST", "interest/");
            xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
            xhr.setRequestHeader("X-CSRF-TOKEN", document.querySelector("#add-interest input[name=_token]").value);
            xhr.send("interest="+addInterestInput.value);
        }
    }
}
if (addInterestForm != null) {
    addInterests();
}

function removeInterests () {
    var removeInterestButtons = Array.from(document.querySelectorAll("#add-interest .fa-close"));
    removeInterestButtons.forEach(element => {
        element.onclick = function () {
            var li = this.parentElement.parentElement,
                interestAdded = document.querySelector("#add-interest .interest-added");
            
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function (){
                if (this.status == 200 && this.readyState == 4) {
                    li.remove();
                }
            }
            xhr.open("GET", "interest/remove/"+li.getAttribute("data-interest"));
            xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded;charset=UTF-8");
            xhr.send();
        }
    });
}

function addComment(formArray) {
    formArray.forEach(form => {
        var postId = form.children[0].value,
            commentTextArea = form.children[1];
        form.onsubmit = function (e) {
            e.preventDefault();
            var that = this;
            if (commentTextArea.value != "" && commentTextArea.value.length <= 5000) {
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (this.readyState === 4 &&this.status === 200){
                        var result = JSON.parse(this.responseText);
                        if (result.error) {
                            var submitCommentErrorHandeler = new ErrorHandeler(document.querySelector(".widget.message-handeler"), result.message),
                                errorDiv = submitCommentErrorHandeler.createErrorCont();
                            submitCommentErrorHandeler.pushError(errorDiv);
                            clearMessages(5000);
                        } else {
                            var submitCommentErrorHandeler = new ErrorHandeler(document.querySelector(".widget.message-handeler"), result.message),
                                successDiv = submitCommentErrorHandeler.createSuccessCont();
                            submitCommentErrorHandeler.pushSuccess(successDiv);
                            that.parentElement.parentElement.parentElement.children[0].innerHTML += result.comment;
                            commentTextArea.value = "";
                            clearMessages(5000);
                        }
                    }
                }
                xhr.open("GET", `/comment/add/${postId}/${commentTextArea.value}`);
                xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded;charset=UTF-8");
                xhr.send();
            } else {
                var submitCommentErrorHandeler = new ErrorHandeler(document.querySelector(".widget.message-handeler"), "this filed can not be empty and must'nt be over than 5000 charachter"),
                    errorDiv = submitCommentErrorHandeler.createErrorCont();
                submitCommentErrorHandeler.pushError(errorDiv);
                clearMessages(5000);
            }
        }
    });
}

if (document.querySelectorAll("#add-interest .fa-close") != null) {
    removeInterests();
}
if (postCommentForm != []){
    addComment(postCommentForm);
}

function getComments(id) {
    return new Promise(function (resolve, reject) {
        var xhr = new XMLHttpRequest();

        xhr.open("GET", "/comment/get/"+id, true);

        xhr.onload = function () {
            if (this.status === 200) {
                resolve(JSON.parse(xhr.responseText));
            } else {
                reject("failed to load comments");
            }
        }
        xhr.onerror = function () {
            reject("something went wrong, check your connection and try again");
        }
        xhr.send();
    });
}

function showCommentsArea() {
    showCommentsButton.forEach(showCommentButton => {
        showCommentButton.onclick = function () {
            var commentArea = this.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.nextSibling.nextSibling,
                centralMeta = this.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement,
                weComment = commentArea.children[2];
                postId = weComment.children[2].children[1].children[0].children[0].value;
            if (commentArea.getAttribute("data-open") === "closed") {
                commentArea.setAttribute("data-open", "opened");
                commentArea.classList.add("active-comment");
                if (centralMeta.clientHeight <= 450 ) {
                    centralMeta.classList.add("comment-on");
                }
                getComments(postId).then(
                    function (resolve) {
                        ({error, message, comments} = resolve);
                        if (!error) {
                            if (comments.length !== 0){
                                comments.forEach(comment => {
                                    weComment.children[0].innerHTML += comment;
                                });
                            } else {
                                weComment.children[0].innerHTML += "<li class='comments-warn'><div class='alert alert-warning'>No comments to show</div></li>";
                            }
                        }
                    },
                    function (reject) {console.log(reject)}
                );
            } else {
                commentArea.classList.add("active-comment");
                if (centralMeta.clientHeight <= 450 ) {
                    centralMeta.classList.add("comment-on");
                }
            }
        }
    });
}

function closeFunctionArea() {
    closeCommentAreaButtons.forEach(closeCommentArea => {
        closeCommentArea.onclick = function () {
            centralMeta = this.parentElement.parentElement;
            this.parentElement.classList.remove("active-comment");
            centralMeta.classList.remove("comment-on");
        };
    });
}

function getMoreComments(){
    moreCommentsButton.forEach(commentButton => {
        var start = 10;
        commentButton.onclick = function (e) {
            e.preventDefault();
            var that = this;
            var postId = this.getAttribute("data-post");
            const xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    var result = JSON.parse(this.responseText),
                        commentBox = that.parentElement.parentElement.children[0];
                    result.comments.forEach(comment => {
                        commentBox.innerHTML += comment;
                    });
                }
            }
            xhr.open("GET", "/comment/getMore/"+postId+"/"+start);
            xhr.send();
            start += 10;
        }
    });
}

var moreCommentsButton = document.querySelectorAll(".coment-area .more-comments a");
if (moreCommentsButton !== []) {
    getMoreComments();
}

var showCommentsButton = document.querySelectorAll(".user-post span.comment"),
    closeCommentAreaButtons = document.querySelectorAll(".coment-area .close-comment-area");
if (showCommentsButton != []) {
    showCommentsArea();
    closeFunctionArea();
}
var addLikeButtons = document.querySelectorAll(".post-meta .like");

function likeHandeler() {
    addLikeButtons.forEach(addLikeButton => {
        addLikeButton.onclick = function () {
            var xhr = new XMLHttpRequest(),
                postId = this.getAttribute("data-post"),
                that = this;
            xhr.onload = function () {
                if (xhr.status === 200) {
                    var result = JSON.parse(xhr.responseText);
                    that.querySelector("ins").innerHTML= result.loves;
                    if (result.ireacted) {
                        that.querySelector("i").classList.add("ireacted");
                    } else {
                        that.querySelector("i").classList.remove("ireacted");
                    }
                }
            }
            xhr.open("GET", "/reacts/"+postId);
            xhr.send();
        }
    });
}
if (addLikeButtons != []) {
    likeHandeler();
}

// load data when scrolling
var loadmorediv = document.querySelector(".loadMore");
function getmore(url) {
    return new Promise(function (resolve, reject) {
        var xhr = new XMLHttpRequest();

        xhr.open("GET", url, false);

        xhr.onload = function (e) {
            if (this.status === 200) {
                resolve(JSON.parse(xhr.responseText));
            } else {
                e.preventDefault();
                reject("failed to load data");
            }
        }
        xhr.onerror = function (e) {
            e.preventDefault();
            reject("something went wrong, check your connection and try again");
        }
        xhr.send();
    });
}
function loadMorePosts(whatPage, start) {
    if (whatPage === "profile-me") {
        var start = start,
            userId = loadmorediv.getAttribute("data-user");
        if (loadmorediv.getAttribute("data-scroll") === "start") {
            getmore("/post/getmore/"+start+"/"+whatPage+"/0/"+"user/"+userId).then(
                function (resolve) {
                    console.log(resolve);
                    var resolved = resolve.posts;
                    if (resolved.length === 0) {
                        loadmorediv.setAttribute("data-scroll", "finished");
                    }
                    resolved.forEach(post => {
                        var contentElement = document.querySelectorAll('.central-meta.item')[1].cloneNode(true);
                        // replace post data
                        contentElement.querySelector(".user-post figure img").setAttribute("src", resolve.profile_image_destination+post.user_avatar);
                        contentElement.querySelector(".user-post .friend-name ins a").setAttribute("href", "");
                        contentElement.querySelector(".user-post .friend-name ins a").innerHTML = post.username;
                        contentElement.querySelector(".user-post .friend-name span").innerHTML = "published: "+dateHandeler(post.created_at);
                        contentElement.querySelector(".user-post .post-meta .description p").innerHTML = post.postText;
                        // remove videos and images on the post meta
                        if (contentElement.querySelector(".user-post .post-meta img") != null) {
                            contentElement.querySelector(".user-post .post-meta img").remove();
                        }
                        if (contentElement.querySelector(".user-post .post-meta video") != null) {
                            contentElement.querySelector(".user-post .post-meta video").remove();
                        }
                        // detrimine if there is an image
                        if (post.withImage) {
                            var newImage = document.createElement("img");
                            newImage.setAttribute("src", resolve.post_images_destination+post.image);
                            contentElement.querySelector(".user-post .post-meta").insertBefore(newImage, contentElement.querySelector(".user-post .post-meta .we-video-info"));
                        }
                        // detrimine if there is a video
                        if (post.withVideo) {
                            var newVideo = document.createElement("video");
                            newVideo.setAttribute("controls", "");
                            var videoSRC = document.createElement("source");
                            videoSRC.setAttribute("src", resolve.post_videos_destination+post.video);
                            newVideo.append(videoSRC);
                            contentElement.querySelector(".user-post .post-meta").insertBefore(newVideo, contentElement.querySelector(".user-post .post-meta .we-video-info"));
                        }
                        contentElement.querySelector(".coment-area .more-comments a").setAttribute("data-post", post.id);
                        contentElement.querySelector(".coment-area form input").value = post.id;
                        loadmorediv.append(contentElement);
                    });
                    showCommentsButton = document.querySelectorAll(".user-post span.comment");
                    showCommentsArea();
                    addLikeButtons = document.querySelectorAll(".post-meta .like");
                    likeHandeler();
                    moreCommentsButton = document.querySelectorAll(".coment-area .more-comments a");
                    getMoreComments();
                },
                function (reject) {console.log(reject);}
            );
        }
    } else if (whatPage === "timeline") {
        var start = start,
            userId = loadmorediv.getAttribute("data-user");
        if (loadmorediv.getAttribute("data-scroll") === "start") {
            getmore("/post/getmore/"+start+"/"+whatPage+"/0/"+"user/"+userId).then(
                function (resolve) {
                    
                    var resolved = resolve.posts;
                    // console.log(resolved);
                    resolved.forEach(post => {
                        var contentElement = document.querySelectorAll('.central-meta.item')[1].cloneNode(true);
                        // replace post data
                        contentElement.querySelector(".user-post figure img").setAttribute("src", resolve.profile_image_destination+post.user_avatar);
                        contentElement.querySelector(".user-post .friend-name ins a").setAttribute("href", "");
                        contentElement.querySelector(".user-post .friend-name ins a").innerHTML = post.username;
                        contentElement.querySelector(".user-post .friend-name span").innerHTML = "published: "+dateHandeler(post.created_at);
                        contentElement.querySelector(".user-post .post-meta .description p").innerHTML = post.postText;
                        // remove videos and images on the post meta
                        if (contentElement.querySelector(".user-post .post-meta img") != null) {
                            contentElement.querySelector(".user-post .post-meta img").remove();
                        }
                        if (contentElement.querySelector(".user-post .post-meta video") != null) {
                            contentElement.querySelector(".user-post .post-meta video").remove();
                        }
                        // detrimine if there is an image
                        if (post.withImage) {
                            var newImage = document.createElement("img");
                            newImage.setAttribute("src", resolve.post_images_destination+post.image);
                            contentElement.querySelector(".user-post .post-meta").insertBefore(newImage, contentElement.querySelector(".user-post .post-meta .we-video-info"));
                        }
                        // detrimine if there is a video
                        if (post.withVideo) {
                            var newVideo = document.createElement("video");
                            newVideo.setAttribute("controls", "");
                            var videoSRC = document.createElement("source");
                            videoSRC.setAttribute("src", resolve.post_videos_destination+post.video);
                            newVideo.append(videoSRC);
                            contentElement.querySelector(".user-post .post-meta").insertBefore(newVideo, contentElement.querySelector(".user-post .post-meta .we-video-info"));
                        }
                        contentElement.querySelector(".coment-area .more-comments a").setAttribute("data-post", post.id);
                        contentElement.querySelector(".coment-area form input").value = post.id;
                        loadmorediv.append(contentElement);
                    });
                    showCommentsButton = document.querySelectorAll(".user-post span.comment");
                    showCommentsArea();
                    addLikeButtons = document.querySelectorAll(".post-meta .like");
                    likeHandeler();
                    moreCommentsButton = document.querySelectorAll(".coment-area .more-comments a");
                    getMoreComments();
                },
                function (reject) {console.log(reject);}
            );
        }
    }
}
if (loadmorediv !== null) {
    var start = 15;
    var lastDateArray = loadmorediv.querySelectorAll(".central-meta .friend-name span");
    var lastDate = lastDateArray[lastDateArray.length - 1];
    var newStart = lastDate.getAttribute("data-create");
    if (newStart !== "") {
        var d = Date.parse(newStart);
        var theDay = 60*60*24*1000;
        start = (d - (theDay * 7)) /1000;
    }
    window.onscroll = function(ev) {
        if ((window.innerHeight + window.scrollY) == (document.body.offsetHeight) ) {
            loadMorePosts(loadmorediv.getAttribute("data-page"), start);
            if (newStart === ""){
                start += 15;
            } else {
                var theDay = 60*60*24,
                    newTime = (start - (theDay * 4));
                start = newTime;
                lastDateArray = loadmorediv.querySelectorAll(".central-meta .friend-name span");
                lastDate = lastDateArray[lastDateArray.length - 1];
                newStart = lastDate.getAttribute("data-create");
            }
        }
    };
}

function loadMoreMediaFunc(href, start = 10) {
    var href = href.split("/");
    var pageIdentifier = href[href.length - 1],
        userId = href[href.length - 2];
        
    if (pageIdentifier === "timeline-videos") {
        getmore("/profile/getmore/timeline-videos/user/"+userId+"/start/"+start).then(
            function (resolve) {
                var resolved = resolve.videos;
                if (resolved.length > 0) {
                    var profileVideo = document.querySelector(".photos.profile-video");
                    for (let i = 0; i < resolved.length; i++) {
                        var li = document.createElement("li");
                        var videoEl = document.createElement("video");
                        videoEl.setAttribute("controls","controls");
                        var source = document.createElement("source");
                        source.setAttribute("src", "/uploads/videos/post_video/"+resolved[i].video);
                        videoEl.append(source);
                        li.append(videoEl);
                        profileVideo.append(li);
                    }
                } else {
                    loadMoreMedia.setAttribute("data-get", "finished");
                }
            }, function (reject) {
                loadMoreMedia.setAttribute("data-get", "finished");
            }
        );
    }else {
        getmore("/profile/getmore/timeline-photos/user/"+userId+"/start/"+start).then(
            function (resolve) {
                var resolved = resolve.photos;
                if (resolved.length > 0) {
                    var profileImage = document.querySelector(".photos");
                    console.log(resolved);
                    for (let i = 0; i < resolved.length; i++) {
                        var href = "";
                        if (resolved[i].identifier === "post") {
                            href = "/"+resolve.post_images_destination+"/"+resolved[i].image;
                        } else if (resolved[i].identifier === "cover") {
                            href = "/"+resolve.profile_cover_destination+"/"+resolved[i].image;
                        } else if (resolved[i].identifier === "profile") {
                            href = "/"+resolve.profile_image_destination+"/"+resolved[i].image;
                        }
                        var li = document.createElement("li");
                        var a = document.createElement("a");
                        a.setAttribute("href", href);
                        a.classList.add("strip");
                        a.setAttribute("data-strip-group", "mygroup");
                        a.setAttribute("data-strip-group-options", "loop: false");
                        var imgEl = document.createElement("img");
                        imgEl.setAttribute("src", href);
                        a.append(imgEl);
                        li.append(a);
                        profileImage.append(li);
                    }
                } else {
                    loadMoreMedia.setAttribute("data-get", "finished");
                }
            }, function (reject) {
                console.log(reject);
            }
        );
    }
}

// load more profile media
var loadMoreMedia = document.querySelector(".btn-load-more.load-more-media");
if (loadMoreMedia !== null) {
    var start = 10;
    loadMoreMedia.onclick = function () {
        if (this.getAttribute("data-get") === "click") {
            loadMoreMediaFunc(window.location.pathname, start);
            start += 10;
        }
    }
}

function sendFriendRequest() {
    var userIdFromButton = addForm.querySelector("button").getAttribute("data-user");
    var token = addForm.querySelector("input[name=_token]").value;
    
    idTwo = userIdFromButton;
    
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var result = JSON.parse(this.responseText);
            addForm.querySelector("button").setAttribute("data-friendship", result.status);
            addForm.querySelector("button").innerHTML = result.status;
        }
    }
    xhr.open("POST", "/profile/sendFriendRequest");
    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader("X-CSRF-TOKEN", token);
    xhr.send("id="+idTwo);
    
}

function deleteFriendRequest() {
    
    var userIdFromButton = addForm.querySelector("button").getAttribute("data-user");
    var token = addForm.querySelector("input[name=_token]").value;
    
    idTwo = userIdFromButton;

    
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var result = JSON.parse(this.responseText);
            addForm.querySelector("button").setAttribute("data-friendship", result.status);
            addForm.querySelector("button").innerHTML = result.status;
            console.log(result);
        }
    }
    xhr.open("POST", "/profile/deleteFriendRequest");
    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader("X-CSRF-TOKEN", token);
    xhr.send("id="+idTwo);
    
}

function deleteSpeceficFriendRequest(id, token) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var result = JSON.parse(this.responseText);
            if (!result.error){
                location.reload(true);
            }
        }
    }
    xhr.open("POST", "/profile/deleteSpeceficFriendRequest");
    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader("X-CSRF-TOKEN", token);
    xhr.send("id="+id);
}
function confirmSpeceficFriendRequest(id, token) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var result = JSON.parse(this.responseText);
            if (!result.error) {
                location.reload(true);
            }
        }
    }
    xhr.open("POST", "/profile/confirmSpeceficFriendRequest");
    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader("X-CSRF-TOKEN", token);
    xhr.send("id="+id);
}

var addForm = document.querySelector(".feature-photo .add-btn form");
if (addForm !== null) {
    addForm.onsubmit = function (e) {
        e.preventDefault();
        var addButton = addForm.querySelector("button").getAttribute("data-friendship");
        if(addButton == "addfriend"){
            sendFriendRequest();
        } else if (addButton == "pending") {
            deleteFriendRequest();
        } else if (addButton == "unfriend") {
            deleteFriendRequest();
        }
    }
}

var deleteFrnd = document.querySelectorAll(".pepl-info a.delete-frnd");
if (deleteFrnd !== []) {
    deleteFrnd.forEach(el => {
        el.onclick = function (e) {
            e.preventDefault();
            var token = el.parentElement.querySelector("input[name=_token]").value,
                friendId = el.getAttribute("data-friend");
            deleteSpeceficFriendRequest(friendId, token);
        }
    });
}

var deleteFriendRequestBtns = document.querySelectorAll(".friend-request-controle .delete-frnd-req");
if (deleteFriendRequestBtns !== []) {
    deleteFriendRequestBtns.forEach(deleteFriendRequestBtn => {
        deleteFriendRequestBtn.onclick = function (e) {
            e.preventDefault();
            var friendId = this.getAttribute("data-frnd"),
                tokenElement = this.parentElement,
                token = tokenElement.querySelector("input").value;
            deleteSpeceficFriendRequest(friendId, token);
            location.reload(true);
        }
    });
}

var confirmFriendRequestBtns = document.querySelectorAll(".friend-request-controle .confirm-frnd-req");
if (confirmFriendRequestBtns !== []) {
    confirmFriendRequestBtns.forEach(confirmFriendRequestBtn => {
        confirmFriendRequestBtn.onclick = function (e) {
            e.preventDefault();
            var friendId = this.getAttribute("data-frnd"),
                tokenElement = this.parentElement,
                token = tokenElement.querySelector("input").value;
            console.log(friendId, token);
            confirmSpeceficFriendRequest(friendId, token);
            
        }
    });
}

function followUser (id, csrf) {
    var xhr = new XMLHttpRequest()
        userId = id;

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var result = JSON.parse(this.responseText);
        }
    }
    xhr.open("POST", "/profile/follow");
    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader("X-CSRF-TOKEN", csrf);
    xhr.send("id="+userId);
}

function unfollowUser (id, csrf) {
    var xhr = new XMLHttpRequest()
        userId = id;

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var result = JSON.parse(this.responseText);
        }
    }
    xhr.open("POST", "/profile/unfollow");
    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader("X-CSRF-TOKEN", csrf);
    xhr.send("id="+userId);
}

var followBtn = document.querySelector(".dropdown .follow");
var unfollowBtn = document.querySelector(".dropdown .unfollow");
if (followBtn !== null) {
    followBtn.onclick = function (e) {
        e.preventDefault();
        if (!this.classList.contains("active")) {
            var csrf = document.querySelector(".add-btn .dropdown input[name=_token]").value;
            followUser(this.getAttribute("data-follow"), csrf);
            var btns = document.querySelectorAll(".add-btn .dropdown li a");
            btns.forEach(el => {
                el.classList.remove("active");
            });
            this.classList.add("active");
        }
    }

    unfollowBtn.onclick = function (e) {
        e.preventDefault();
        if (!this.classList.contains("active")) {
            var csrf = document.querySelector(".add-btn .dropdown input[name=_token]").value;
            unfollowUser(this.getAttribute("data-unfollow"), csrf);
            var btns = document.querySelectorAll(".add-btn .dropdown li a");
            btns.forEach(el => {
                el.classList.remove("active");
            });
            this.classList.add("active");
        }
    }
}

