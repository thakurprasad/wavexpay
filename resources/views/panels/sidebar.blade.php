<aside
  class="{{$configData['sidenavMain']}} @if(!empty($configData['activeMenuType'])) {{$configData['activeMenuType']}} @else {{$configData['activeMenuTypeClass']}}@endif @if(($configData['isMenuDark']) === true) {{'sidenav-dark'}} @elseif(($configData['isMenuDark']) === false){{'sidenav-light'}}  @else {{$configData['sidenavMainColor']}}@endif">
  <div class="brand-sidebar">
    <h1 class="logo-wrapper">
      <a class="brand-logo darken-1" href="{{asset('/')}}">
        @if(!empty($configData['mainLayoutType']) && isset($configData['mainLayoutType']))
          @if($configData['mainLayoutType']=== 'vertical-modern-menu')
          <img class="hide-on-med-and-down" src="{{asset($configData['largeScreenLogo'])}}" alt="materialize logo" />
          <img class="show-on-medium-and-down hide-on-med-and-up" src="{{asset($configData['smallScreenLogo'])}}"
            alt="materialize logo" />

          @elseif($configData['mainLayoutType']=== 'vertical-menu-nav-dark')
          <img src="{{asset($configData['smallScreenLogo'])}}" alt="materialize logo" />

          @elseif($configData['mainLayoutType']=== 'vertical-gradient-menu')
          <img class="show-on-medium-and-down hide-on-med-and-up" src="{{asset($configData['largeScreenLogo'])}}"
            alt="materialize logo" />
          <img class="hide-on-med-and-down" src="{{asset($configData['smallScreenLogo'])}}" alt="materialize logo" />

          @elseif($configData['mainLayoutType']=== 'vertical-dark-menu')
          <img class="show-on-medium-and-down hide-on-med-and-up" src="{{asset($configData['largeScreenLogo'])}}"
            alt="materialize logo" />
          <img class="hide-on-med-and-down" src="{{asset($configData['smallScreenLogo'])}}" alt="materialize logo" />
          @endif
        @endif
        <span class="logo-text hide-on-med-and-down">
          @if(!empty ($configData['templateTitle']) && isset($configData['templateTitle']))
          {{$configData['templateTitle']}}
          @else
          Materialize
          @endif
        </span>
      </a>
      <a class="navbar-toggler" href="javascript:void(0)"><i class="material-icons">radio_button_checked</i></a></h1>
  </div>
  <ul class="sidenav sidenav-collapsible leftside-navigation collapsible sidenav-fixed menu-shadow" id="slide-out"
    data-menu="menu-navigation" data-collapsible="menu-accordion">

    <!---New code for menu add by T.Prasad at 09/12/2021 --->
      <li class="{{(request()->is('users/*')) ? 'active' : '' }} bold"><a class="collapsible-header waves-effect waves-cyan " href="JavaScript:void(0)"><i class="material-icons">people</i><span class="menu-title" data-i18n="Dashboard">{{ __('t.Users') }}</span><span class="badge badge pill orange float-right mr-10">2</span></a>
          <div class="collapsible-body">
            <ul class="collapsible collapsible-sub" data-collapsible="accordion">
              <li class="{{(request()->is('users/create')) ? 'active' : '' }}">
                <a class="{{(request()->is('users/create')) ? 'active' : '' }}" href="{{ url('users/create') }}"><i class="material-icons">radio_button_unchecked</i><span data-i18n="Modern">{{ __('t.Add New User') }}</span></a>
              </li>
              <li class="{{(request()->is('users')) ? 'active' : '' }}">
                <a class="{{(request()->is('users')) ? 'active' : '' }}" href="{{ url('/users') }}"><i class="material-icons">radio_button_unchecked</i><span data-i18n="eCommerce">{{ __('t.User List') }}</span></a>
              </li>              
            </ul>
          </div>
        </li>
        <li class="{{(request()->is('users/create')) ? 'active' : '' }} bold"><a class="collapsible-header waves-effect waves-cyan " href="JavaScript:void(0)"><i class="material-icons">lock</i><span class="menu-title" data-i18n="Dashboard">{{ __('t.Roles') }}</span><span class="badge badge pill orange float-right mr-10">3</span></a>
          <div class="collapsible-body">
            <ul class="collapsible collapsible-sub" data-collapsible="accordion">
              <li class="{{(request()->is('roles/create')) ? 'active' : '' }}"><a class="{{(request()->is('roles/create')) ? 'active' : '' }}" href="{{ url('roles/create') }}"><i class="material-icons">radio_button_unchecked</i><span data-i18n="Modern">{{ __('t.Add New Role') }}</span></a>
              </li>
              <li class="{{(request()->is('roles')) ? 'active' : '' }}"><a class="{{(request()->is('roles')) ? 'active' : '' }}" href="{{ url('roles') }}"><i class="material-icons">radio_button_unchecked</i><span data-i18n="eCommerce">{{ __('t.Role List') }}</span></a>
              </li>              
            </ul>
          </div>
        </li>

        <li class="active bold"><a class="collapsible-header waves-effect waves-cyan " href="JavaScript:void(0)"><i class="material-icons">import_contacts</i><span class="menu-title" data-i18n="Dashboard">Invoice</span><span class="badge badge pill orange float-right mr-10">3</span></a>
          <div class="collapsible-body">
            <ul class="collapsible collapsible-sub" data-collapsible="accordion">
              <li class="active"><a class="active" href="{{ url('/invoices/add') }}"><i class="material-icons">radio_button_unchecked</i><span data-i18n="Modern">{{ __('t.Add New Invoice') }}</span></a>
              </li>
              <li><a href="{{ url('/invoices/list') }}"><i class="material-icons">radio_button_unchecked</i><span data-i18n="eCommerce">{{ __('t.Invoice List') }}</span></a>
              </li>              
            </ul>
          </div>
        </li>


        <li class="active bold"><a class="collapsible-header waves-effect waves-cyan " href="JavaScript:void(0)"><i class="material-icons">import_contacts</i><span class="menu-title" data-i18n="Dashboard">Settlements</span></a>
          <div class="collapsible-body">
            <ul class="collapsible collapsible-sub" data-collapsible="accordion">
              <li class="active"><a class="active" href="{{ url('/settlements/done') }}"><i class="material-icons">radio_button_unchecked</i><span data-i18n="Modern">{{ __('t.Done') }}</span></a>
              </li>
              <li><a href="{{ url('/settlements/pending') }}"><i class="material-icons">radio_button_unchecked</i><span data-i18n="eCommerce">{{ __('t.Pending') }}</span></a>
              </li>              
            </ul>
          </div>
        </li>
        
    <!-- end --->

    {{-- Foreach menu item starts --}}
    @if(!empty($menuData[0]) && isset($menuData[0]))
      @foreach ($menuData[0]->menu as $menu)
        @if(isset($menu->navheader))
        <li class="navigation-header">
          <a class="navigation-header-text">{{ $menu->navheader }}</a>
          <i class="navigation-header-icon material-icons">{{$menu->icon }}</i>
        </li>
        @else
        @php
          $custom_classes="";
          if(isset($menu->class))
          {
          $custom_classes = $menu->class;
          }
        @endphp
        <li class="bold {{(request()->is($menu->url.'*')) ? 'active' : '' }}">
          <a class="{{$custom_classes}} {{ (request()->is($menu->url.'*')) ? 'active '.$configData['activeMenuColor'] : ''}}"
            @if(!empty($configData['activeMenuColor'])) {{'style=background:none;box-shadow:none;'}} @endif
            href="@if(($menu->url)==='javascript:void(0)'){{$menu->url}} @else{{url($menu->url)}} @endif"
            {{isset($menu->newTab) ? 'target="_blank"':''}}>
            <i class="material-icons">{{$menu->icon}}</i>
            <span class="menu-title">{{ __('locale.'.$menu->name)}}</span>
            @if(isset($menu->tag))
            <span class="{{$menu->tagcustom}}">{{$menu->tag}}</span>
            @endif
          </a>
          @if(isset($menu->submenu))
            @include('panels.submenu', ['menu' => $menu->submenu])
          @endif
        </li>
        @endif
      @endforeach
    @endif
  </ul>
  <div class="navigation-background"></div>
  <a class="sidenav-trigger btn-sidenav-toggle btn-floating btn-medium waves-effect waves-light hide-on-large-only"
    href="#" data-target="slide-out"><i class="material-icons">menu</i></a>
</aside>