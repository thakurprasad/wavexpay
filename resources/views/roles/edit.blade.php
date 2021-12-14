{{-- extend layout --}}
@extends('layouts.contentLayoutMaster')

{{-- page title --}}
@section('title','Edit Role')

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
              <div class="row">

            @include('alerts.message')
{!! Form::model($role, ['method' => 'PATCH','route' => ['roles.update', $role->id]]) !!}

              <h2 class="card-title">Update Role</h2>                
                <div class="row">
                  <div class="input-field col m6 s12">
                    <i class="material-icons prefix">vpn_key</i>
                    {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
                    <label for="name">Role Name</label>
                  </div>
              </div>

              <div class="row">            
                <h5>Select Permissions</h5>  
                   @foreach($permission as $value)
                       <div class="input-field col m3 s12">
                              <label class="m5">
                                <input type="checkbox" name="permission[]" value="{{ $value->id }}" {{  in_array($value->id, $rolePermissions) ? 'checked' : '' }} />
                                <span>{{ $value->name }}</span>
                              </label>
                        </div>
                    @endforeach

              </div>
               <div class="col s12 display-flex justify-content-end mt-3">
                <button type="submit" class="btn cyan waves-effect waves-light right" name="update">
                  Update Role</button>
              </div>
          </div>
{!! Form::close() !!}
            </div>
        </div>
    </div>
</div>



@endsection