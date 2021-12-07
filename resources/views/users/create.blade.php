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
          <h4 class="card-title">Create New User</h4>
          
        {!! Form::open(array('route' => 'users.store','method'=>'POST')) !!}

            @if (count($errors) > 0)
              <div class="alert alert-danger">
                <strong>Whoops!</strong> There were some problems with your input.<br><br>
                <ul>
                   @foreach ($errors->all() as $error)
                     <li>{{ $error }}</li>
                   @endforeach
                </ul>
              </div>
            @endif

            <div class="row">
              <div class="input-field col m4 s6">
                <i class="material-icons prefix">account_circle</i>
               {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
                <label for="name">Name</label>
              </div>
            
              <div class="input-field col m4 s6">
                <i class="material-icons prefix">email</i>
                 {!! Form::text('email', null, array('placeholder' => 'Email','class' => 'form-control')) !!}
                 <label for="email">Email</label>
              </div>
          
              <div class="input-field col m4 s6">
                <i class="material-icons prefix">lock</i>
                  {!! Form::password('password', array('placeholder' => 'Password','class' => 'form-control')) !!}
                <label for="password">Password</label>
              </div>
           
             <div class="input-field col m4 s6">
                <i class="material-icons prefix">lock</i>
                  {!! Form::password('confirm-password', array('placeholder' => 'Confirm Password','class' => 'form-control')) !!}
                <label for="confirm-password">Confirm Password</label>
              </div>

              <div class="input-field col m4 s6">
                <i class="material-icons prefix">vpn_key</i>
                    {!! Form::select('roles[]', $roles,[], array('class' => 'form-control','multiple')) !!}
                <label for="confirm-password">Select Role</label>
              </div>
              

              <div class="row">
                <div class="input-field col s12">
                  <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Submit
                    <i class="material-icons right">send</i>
                  </button>
                </div>
              </div>
            </div>
          
{!! Form::close() !!}
        </div>
      </div>
    </div>

</div> 

@endsection