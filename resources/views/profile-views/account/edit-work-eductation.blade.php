<!DOCTYPE html>
<html lang="en">

@include('includes.head')
<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">
	
	@include('includes.responsive-header')
	@include('includes.header')
	@include('includes.website-components.profile-components.feature-photo')
	

	<section>
		<div class="gap gray-bg">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="row" id="page-contents">
							<div class="col-lg-3">
								<aside class="sidebar static">
									@include('includes.website-components.recent-activites')
									@include('includes.website-components.profile-components.edit-info')									
								</aside>
							</div><!-- sidebar -->
							<div class="col-lg-6">
								<div class="central-meta">
									<div class="editing-info">
										<h5 class="f-title"><i class="ti-info-alt"></i> Edit work & Education</h5>

										<form method="post" action="work-eductation/">
											@csrf
											<div class="checkbox">
											  <label>
												<input type="checkbox" name="graduate" @if ($edu_info->graduate) checked="checked" @endif ><i class="check-box"></i>Graduate
											  </label>
											</div>
											<div class="form-group">
											  <input type="text" name="studying_at" id="input" value="{{$edu_info->studying_at}}" />
											  <label class="control-label" for="input">Studying at</label><i class="mtrl-select"></i>
											</div>
											<div class="form-group half">
											  <input type="text" name="start_year" value="{{$edu_info->start_year}}" />
											  <label class="control-label" for="input">From</label><i class="mtrl-select"></i>
											</div>
											<div class="form-group half">
											  <input type="text" name="finish_year" value="{{$edu_info->finish_year}}" />
											  <label class="control-label" for="input">To</label><i class="mtrl-select"></i>
											</div>												
											<div class="form-group">
											  <input type="text" name="studying_city" value="{{$edu_info->studying_city}}" />
											  <label class="control-label" for="input">City</label><i class="mtrl-select"></i>
											</div>
											<div class="submit-btns">
												<button type="submit" class="mtr-btn"><span>Update</span></button>
											</div>
										</form>
									</div>
								</div>	
							</div><!-- centerl meta -->
							<div class="col-lg-3">
								<aside class="sidebar static">
									
								</aside>
							</div><!-- sidebar -->
						</div>	
					</div>
				</div>
			</div>
		</div>	
	</section>
	@include('includes.footer')
</div>
	@include('includes.side-panel')
	@include('includes.scripts')
</body>	
</html>