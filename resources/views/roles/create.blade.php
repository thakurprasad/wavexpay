{{-- extend layout --}}
@extends('layouts.contentLayoutMaster')

{{-- page title --}}
@section('title','Page Collapse')

{{-- vendor style --}}
@section('vendor-style')
<link rel="stylesheet" type="text/css" href="{{asset('vendors/flag-icon/css/flag-icon.min.css')}}">
@endsection

{{-- page content --}}
@section('content')



<div class="section">
     <!-- Form with icon prefixes -->
        <div class="col s12 m12 l12">
          <div id="prefixes" class="card card card-default scrollspy">
            <div class="card-content">
              @if(count($errors) > 0)
                <div class="alert alert-danger">
                    <strong>Whoops!</strong> There were some problems with your input.<br><br>
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif


{!! Form::open(array('route' => 'roles.store','method'=>'POST')) !!}

              <h2 class="card-title">Create New Role</h2>
                
                <div class="row">
                  <div class="input-field col m6 s12">
                    <i class="material-icons prefix">vpn_key</i>
                   {!! Form::text('name', null, array('class' => 'form-control validate')) !!}
                    <label for="name">Role Name <span class="required">*</span></label>
                  </div>
              </div>

              <div class="row">            
                    <h5>Select Permissions</h5>      
                    @foreach($permission as $value)
                        <div class="input-field col m3 s12">
                              <label class="m5">
                                <input type="checkbox" name="permission[]" value="{{ $value->id }}" />
                                <span>{{ $value->name }}</span>
                              </label>
                        </div>      
                    @endforeach
              </div>

              <div class="row container">
                <div class="input-field col s12">
                  <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Submit
                    <i class="material-icons right">send</i>
                  </button>
                </div>
              </div>

{!! Form::close() !!}
            </div>
        </div>
    </div>
</div>

@endsection