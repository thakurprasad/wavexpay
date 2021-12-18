{{-- extend layout --}}
@extends('layouts.contentLayoutMaster')

{{-- page title --}}
@section('title','Getway Configuration Settings')

{{-- vendor styles --}}
@section('vendor-style')
<link rel="stylesheet" type="text/css" href="{{asset('vendors/select2/select2.min.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('vendors/select2/select2-materialize.css')}}">
@endsection

{{-- page style --}}
@section('page-style')
<link rel="stylesheet" type="text/css" href="{{asset('css/pages/page-account-settings.css')}}">
@endsection

{{-- page content --}}
@section('content')
<!-- Account settings -->
<section class="tabs-vertical mt-1 section">
  <div class="row">
    <div class="col l4 s12">
      <!-- tabs  -->
      <div class="card-panel">
        <ul class="tabs">
          <li class="tab">
            <a href="#general">
              <i class="material-icons">brightness_low</i>
              <span>CashFree</span>
            </a>
          </li>
          <li class="tab">
            <a href="#notifications">
              <i class="material-icons">notifications_none</i>
              <span> Settings</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="col l8 s12">
      <!-- tabs content -->
      <div id="general">
        <div class="card-panel">
         <!--div class="display-flex">
            <div class="media">
              <img src="{{asset('images/avatar/avatar-12.png')}}" class="border-radius-4" alt="profile image"
                height="64" width="64">
            </div>
            <div class="media-body">
              <div class="general-action-btn">
                <button id="select-files" class="btn indigo mr-2">
                  <span>Upload new photo</span>
                </button>
                <button class="btn btn-light-pink">Reset</button>
              </div>
              <small>Allowed JPG, GIF or PNG. Max size of 800kB</small>
              <div class="upfilewrapper">
                <input id="upfile" type="file" />
              </div>
            </div>
          </div>
          <div class="divider mb-1 mt-1"></div> -->

<!--test_base_url, live_base_url, x-client-id, x-client-secret, x-api-version, return_url, notify_url, test_base_url, live_base_url, x-client-id, x-client-secret, x-api-version, return_url, notify_url-->

          <form class="formValidate" method="post">
            <div class="row">

              @foreach($settings as $key=>$row)
                <div class="col s12" style="border: 1px solid #ccc;">
                  <div class="input-field">
                      <div class="col s11">
                      <label for="uname">{{$row->type}} : {{$row->key}}</label>
                      <input readonly type="text" id="test_base_url" name="test_base_url" value="{{ $row->value }}" data-error=".errorTxt1">
                      <small class="errorTxt1"></small>
                    </div>
                    <div class="col s1"><br>
                        <a href="#" class="mb-6 btn-floating waves-effect waves-light cyan"><i class="material-icons left">edit</i></a>
                    </div>

                  </div>
                </div>
              @endforeach
              
              <div class="col s12 display-flex justify-content-end form-action">
                <button type="submit" class="btn indigo waves-effect waves-light mr-2">
                  Save changes
                </button>
                <button type="button" class="btn btn-light-pink waves-effect waves-light mb-1">Cancel</button>
              </div>
            </div>
          </form>
        </div>
      </div>
      
    
      <div id="notifications">
        <div class="card-panel">
          <div class="row">
            <h6 class="col s12 mb-2">Activity</h6>
            <div class="col s12 mb-1">
              <div class="switch">
                <label>
                  <input type="checkbox" checked id="accountSwitch1">
                  <span class="lever"></span>
                </label>
                <span class="switch-label w-100">Email me when someone comments on my article</span>
              </div>
            </div>
           <!-- <div class="col s12 mb-1">
              <div class="switch">
                <label>
                  <input type="checkbox" checked id="accountSwitch2">
                  <span class="lever"></span>
                </label>
                <span class="switch-label w-100">
                  Email me when someone answers on my form</span>
              </div>
            </div>
            <div class="col s12 mb-1">
              <div class="switch">
                <label>
                  <input type="checkbox" id="accountSwitch3">
                  <span class="lever"></span>
                </label>
                <span class="switch-label w-100">
                  Email me hen someone follows me</span>
              </div>
            </div>
            <h6 class="col s12 mb-2 mt-2">Application</h6>
            <div class="col s12 mb-1">
              <div class="switch">
                <label>
                  <input type="checkbox" checked id="accountSwitch4">
                  <span class="lever"></span>
                </label>
                <span class="switch-label w-100">News and announcements</span>
              </div>
            </div>
            <div class="col s12 mb-1">
              <div class="switch">
                <label>
                  <input type="checkbox" id="accountSwitch5">
                  <span class="lever"></span>
                </label>
                <span class="switch-label w-100">Weekly product updates</span>
              </div>
            </div>
            <div class="col s12 mb-1">
              <div class="switch">
                <label>
                  <input type="checkbox" class="custom-control-input" checked id="accountSwitch6">
                  <span class="lever"></span>
                </label>
                <span class="switch-label w-100">Weekly blog digest</span>
              </div>
            </div>-->
            <div class="col s12 display-flex justify-content-end form-action mt-2">
              <button type="submit" class="btn indigo waves-light waves-effect mr-sm-1 mr-2">Save
                changes</button>
              <button type="button" class="btn btn-light-pink waves-light waves-effect">Cancel</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
@endsection

{{-- page scripts --}}
@section('vendor-script')
<script src="{{asset('vendors/select2/select2.full.min.js')}}"></script>
<script src="{{asset('vendors/jquery-validation/jquery.validate.min.js')}}"></script>
@endsection

{{-- page script --}}
@section('page-script')
<script src="{{asset('js/scripts/page-account-settings.js')}}"></script>
@endsection