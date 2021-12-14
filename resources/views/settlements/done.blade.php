{{-- layout extend --}}
@extends('layouts.contentLayoutMaster')

{{-- page title --}}
@section('title','Settlements')

{{-- vendor styles --}}
@section('vendor-style')
<link rel="stylesheet" type="text/css" href="{{asset('vendors/data-tables/css/jquery.dataTables.min.css')}}">
<link rel="stylesheet" type="text/css"
  href="{{asset('vendors/data-tables/extensions/responsive/css/responsive.dataTables.min.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('vendors/data-tables/css/dataTables.checkboxes.css')}}">
@endsection

{{-- page styles --}}
@section('page-style')
<link rel="stylesheet" type="text/css" href="{{asset('css/pages/app-invoice.css')}}">
@endsection

{{-- page content --}}
@section('content')
<!-- invoice list -->
<section class="invoice-list-wrapper section">
  <!-- create invoice button-->
  <!-- Options and filter dropdown button-->
  <div class="invoice-filter-action mr-3">
    <a href="javascript:void(0)" class="btn waves-effect waves-light invoice-export border-round z-depth-4">
      <i class="material-icons">picture_as_pdf</i>
      <span class="hide-on-small-only">Export to CSV</span>
    </a>
  </div>
  <!-- create invoice button-->
  <div class="filter-btn">
    <!-- Dropdown Trigger -->
    <a class='dropdown-trigger btn waves-effect waves-light purple darken-1 border-round' href='#'
      data-target='btn-filter'>
      <span class="hide-on-small-only">Filter Invoice</span>
      <i class="material-icons">keyboard_arrow_down</i>
    </a>
    <!-- Dropdown Structure -->
    <ul id='btn-filter' class='dropdown-content'>
      <li><a href="#!">Paid</a></li>
      <li><a href="#!">Unpaid</a></li>
      <li><a href="#!">Partial Payment</a></li>
    </ul>
  </div>
  <div class="responsive-table">
    <table class="table invoice-data-table white border-radius-4 pt-1">
      <thead>
        <tr>
          <!-- data table responsive icons -->
          <th></th>
          <!-- data table checkbox -->
          <th></th>
          <th>
            <span>Merchant Id</span>
          </th>
          <th>Amount</th>
          <th>Date</th>
          <th>Merchant Name</th>
          <th>Domain</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
      </thead>

      <tbody>
        <tr>
          <td></td>
          <td> </td>
          <td>
            <a href="#">M-00788</a>
          </td>
          <td><span class="invoice-amount">₹ 555.50</span></td>
          <td><small>10-06-19</small></td>
          <td><span class="invoice-customer">ExxonMobil</span></td>
          <td>wwww.test1.com</td>
          <td><span class="chip lighten-5 red red-text">UNPAID</span></td>
          <td>
            <div class="invoice-action">
              <a href="#" class="invoice-action-view mr-4">
                <i class="material-icons">remove_red_eye</i>
              </a>
              <a href="#" class="invoice-action-edit">
                <i class="material-icons">edit</i>
              </a>
            </div>
          </td>
        </tr>
        <tr>
          <td></td>
          <td> </td>
          <td>
            <a href="#">M-00326</a>
          </td>
          <td><span class="invoice-amount">₹ 8,563</span></td>
          <td><small>06-01-19</small></td>
          <td><span class="invoice-customer">Wells Fargo</span></td>
         <td>wwww.test2.com</td>
          <td><span class="chip lighten-5 green green-text">PAID</span></td>
          <td>
            <div class="invoice-action">
              <a href="#" class="invoice-action-view mr-4">
                <i class="material-icons">remove_red_eye</i>
              </a>
              <a href="#" class="invoice-action-edit">
                <i class="material-icons">edit</i>
              </a>
            </div>
          </td>
        </tr>
        <tr>
          <td></td>
          <td> </td>
          <td>
            <a href="#">M-00759</a>
          </td>
          <td><span class="invoice-amount">₹ 10,960.20</span></td>
          <td><small>22-05-19</small></td>
          <td><span class="invoice-customer">Ping An Insurance</span></td>
          <td>wwww.test3.com</td>
          <td><span class="chip lighten-5 orange orange-text">Partially Paid</span></td>
          <td>
            <div class="invoice-action">
              <a href="#" class="invoice-action-view mr-4">
                <i class="material-icons">remove_red_eye</i>
              </a>
              <a href="#" class="invoice-action-edit">
                <i class="material-icons">edit</i>
              </a>
            </div>
          </td>
        </tr>
        <tr>
          <td></td>
          <td> </td>
          <td>
            <a href="#">M-00999</a>
          </td>
          <td><span class="invoice-amount">₹ 886.90</span></td>
          <td><small>12-05-19</small></td>
          <td><span class="invoice-customer">Apple</span></td>
          <td>wwww.test4.com</td>
          <td><span class="chip lighten-5 red red-text">UNPAID</span></td>
          <td>
            <div class="invoice-action">
              <a href="#" class="invoice-action-view mr-4">
                <i class="material-icons">remove_red_eye</i>
              </a>
              <a href="#" class="invoice-action-edit">
                <i class="material-icons">edit</i>
              </a>
            </div>
          </td>
        </tr>
        <tr>
          <td></td>
          <td> </td>
          <td>
            <a href="#">M-00223</a>
          </td>
          <td><span class="invoice-amount">₹ 459.30</span></td>
          <td><small>28-04-19</small></td>
          <td><span class="invoice-customer">Communications</span></td>
         <td>wwww.test5.com</td>
          <td><span class="chip lighten-5 green green-text">PAID</span></td>
          <td>
            <div class="invoice-action">
              <a href="#" class="invoice-action-view mr-4">
                <i class="material-icons">remove_red_eye</i>
              </a>
              <a href="#" class="invoice-action-edit">
                <i class="material-icons">edit</i>
              </a>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</section>
@endsection

{{-- vendor scripts --}}
@section('vendor-script')
<script src="{{asset('vendors/data-tables/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('vendors/data-tables/extensions/responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('vendors/data-tables/js/datatables.checkboxes.min.js')}}"></script>
@endsection

{{-- page scripts --}}
@section('page-script')
<script src="{{asset('js/scripts/app-invoice.js')}}"></script>
@endsection