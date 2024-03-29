@extends('layouts.contentLayoutMaster')

{{-- page title --}}
@section('title','App Invoice Edit')

{{-- page styles --}}
@section('page-style')
<link rel="stylesheet" type="text/css" href="{{asset('css/pages/app-invoice.css')}}">
@endsection

{{-- page content --}}
@section('content')
<!-- app invoice View Page -->
<section class="invoice-edit-wrapper section">
  <div class="row">
    <!-- invoice view page -->
    <div class="col xl9 m8 s12">
      <div class="card">
        <div class="card-content px-36">
          <!-- header section -->
          <div class="row mb-3">
            <div class="col xl4 m12 display-flex align-items-center">
              <h6 class="invoice-number mr-4 mb-5">Invoice#</h6>
              <input type="text" value="000756">
            </div>
            <div class="col xl8 m12">
              <div class="invoice-date-picker display-flex align-items-center">
                <div class="display-flex align-items-center">
                  <small>Date Issue: </small>
                  <div class="display-flex ml-4">
                    <input type="text" class="datepicker mr-2 mb-1" value="08/10/2019">
                  </div>
                </div>
                <div class="display-flex align-items-center">
                  <small>Date Due: </small>
                  <div class="display-flex ml-4">
                    <input type="text" class="datepicker mb-1" value="08/10/2019">
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- logo and title -->
          <div class="row mb-3">
            <div class="col m6 s12 invoice-logo display-flex pt-1 push-m6">
              <img src="{{asset('images/gallery/pixinvent-logo.png')}}" alt="logo" height="46" width="164" />
            </div>
            <div class="col m6 s12 pull-m6">
              <h4 class="indigo-text">Invoice</h4>
              <input type="text" value="Admin Template">
            </div>
          </div>
          <!-- invoice address and contact -->
          <div class="row mb-3">
            <div class="col l6 s12">
              <h6>Bill To</h6>
              <div class="input-field">
                <input type="text" value="Clevision PVT. LTD.">
              </div>
              <div class="input-field">
                <textarea class="materialize-textarea" rows="4"
                  placeholder="Enter your address">9205 Whitemarsh Street New York, NY 10002</textarea>
              </div>
              <div class="input-field">
                <input type="email" value="hello@clevision.net">
              </div>
              <div class="input-field">
                <input type="text" value="601-678-8022">
              </div>
            </div>
          </div>
          <!-- product details table-->
          <div class="invoice-product-details mb-3">
            <form class="form invoice-item-repeater">
              <div data-repeater-list="group-a">
                <div class="mb-2" data-repeater-item>
                  <!-- invoice Titles -->
                  <div class="row mb-1">
                    <div class="col s3 m4">
                      <h6 class="m-0">Item</h6>
                    </div>
                    <div class="col s3">
                      <h6 class="m-0">Cost</h6>
                    </div>
                    <div class="col s3">
                      <h6 class="m-0">Qty</h6>
                    </div>
                    <div class="col s3 m2">
                      <h6 class="m-0">Total</h6>
                    </div>
                  </div>
                  <div class="invoice-item display-flex mb-1">
                    <div class="invoice-item-filed row pt-1">
                      <div class="col s12 m4 input-field">
                        <select class="invoice-item-select browser-default">
                          <option value="Frest Admin Template">Frest Admin Template</option>
                          <option value="Stack Admin Template">Stack Admin Template</option>
                          <option value="Robust Admin Template">Robust Admin Template</option>
                          <option value="Apex Admin Template">Apex Admin Template</option>
                          <option value="Modern Admin Template">Modern Admin Template</option>
                        </select>
                      </div>
                      <div class="col m3 s12 input-field">
                        <input type="text" value="24">
                      </div>
                      <div class="col m3 s12 input-field">
                        <input type="text" value="1">
                      </div>
                      <div class="col m2 s12 input-field">
                        <input type="text" value="₹ 24" disabled>
                      </div>
                      <div class="col m4 s12 input-field">
                        <input type="text" class="invoice-item-desc"
                          value="The most developer friendly & highly customization HTML5 Admin">
                      </div>
                      <div class="col m8 s12 input-field">
                        <span>Discount: </span>
                        <span class="discount-value mr-1">0%</span>
                        <span class="mr-1 tax1">0%</span>
                        <span class="mr-1 tax2">0%</span>
                      </div>
                    </div>
                    <div class="invoice-icon display-flex flex-column justify-content-between">
                      <span data-repeater-delete class="delete-row-btn">
                        <i class="material-icons">clear</i>
                      </span>
                      <div class="dropdown">
                        <i class="material-icons dropdown-button" data-target="dropdown-discount">brightness_low</i>
                        <div class="dropdown-content" id="dropdown-discount">
                          <div class="row mr-0 ml-0">
                            <div class="col s12 input-field">
                              <label for="discount">Discount(%)</label>
                              <input type="number" id="discount" value="0">
                            </div>
                            <div class="col s6">
                              <select id="Tax1" class="invoice-tax browser-default">
                                <option value="0%" selected disabled>Tax1</option>
                                <option value="1%">1%</option>
                                <option value="10%">10%</option>
                                <option value="18%">18%</option>
                                <option value="40%">40%</option>
                              </select>
                            </div>
                            <div class="col s6">
                              <select id="Tax2" class="invoice-tax browser-default">
                                <option value="0%" selected disabled>Tax2</option>
                                <option value="1%">1%</option>
                                <option value="10%">10%</option>
                                <option value="18%">18%</option>
                                <option value="40%">40%</option>
                              </select>
                            </div>
                          </div>
                          <div class="display-flex justify-content-between mt-4">
                            <button type="button" class="btn invoice-apply-btn">
                              <span>Apply</span>
                            </button>
                            <button type="button" class="btn invoice-cancel-btn ml-1 indigo">
                              <span>Cancel</span>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="input-field">
                <button class="btn invoice-repeat-btn" data-repeater-create type="button">
                  <i class="material-icons left">add</i>
                  <span>Add Item</span>
                </button>
              </div>
            </form>
          </div>
          <!-- invoice subtotal -->
          <div class="invoice-subtotal">
            <div class="row">
              <div class="col m5 s12">
                <div class="input-field">
                  <input type="text" value="Partial Payment">
                </div>
                <div class="input-field">
                  <input type="text" value="Happy to give you a 10% discount.">
                </div>
              </div>
              <div class="col xl4 m7 s12 offset-xl3">
                <ul>
                  <li class="display-flex justify-content-between">
                    <span class="invoice-subtotal-title">Subtotal</span>
                    <h6 class="invoice-subtotal-value">₹ 72.00</h6>
                  </li>
                  <li class="display-flex justify-content-between">
                    <span class="invoice-subtotal-title">Discount</span>
                    <h6 class="invoice-subtotal-value">- ₹  09.60</h6>
                  </li>
                  <li class="display-flex justify-content-between">
                    <span class="invoice-subtotal-title">Tax</span>
                    <h6 class="invoice-subtotal-value">21%</h6>
                  </li>
                  <li>
                    <div class="divider mt-2 mb-2"></div>
                  </li>
                  <li class="display-flex justify-content-between">
                    <span class="invoice-subtotal-title">Invoice Total</span>
                    <h6 class="invoice-subtotal-value">₹  61.40</h6>
                  </li>
                  <li class="display-flex justify-content-between">
                    <span class="invoice-subtotal-title">Paid to date</span>
                    <h6 class="invoice-subtotal-value">- ₹  00.00</h6>
                  </li>
                  <li class="display-flex justify-content-between">
                    <span class="invoice-subtotal-title">Balance (USD)</span>
                    <h6 class="invoice-subtotal-value">₹  10,953</h6>
                  </li>
                  <li class=" mt-2">
                    <a href="{{asset('app-invoice-view')}}" class="btn btn-block waves-effect waves-light">Preview</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- invoice action  -->
    <div class="col xl3 m4 s12">
      <div class="card invoice-action-wrapper mb-10">
        <div class="card-content">
          <div class="invoice-action-btn">
            <a class="btn indigo waves-effect waves-light display-flex align-items-center justify-content-center">
              <i class="material-icons mr-4">check</i>
              <span class="responsive-text">Send Invoice</span>
            </a>
          </div>
          <div class="invoice-action-btn">
            <a class="btn btn-light-indigo btn-block waves-effect waves-light">
              <span class="responsive-text">Download Invoice</span>
            </a>
          </div>
          <div class="row invoice-action-btn">
            <div class="col s6 preview">
              <a class="btn btn-light-indigo btn-block waves-effect waves-light">
                <span class="responsive-text">Preview</span>
              </a>
            </div>
            <div class="col s6 save">
              <a class="btn btn-light-indigo btn-block waves-effect waves-light">
                <span class="responsive-text">Save</span>
              </a>
            </div>
          </div>
          <div class="invoice-action-btn">
            <a class="btn waves-effect waves-light display-flex align-items-center justify-content-center">
              <i class="material-icons mr-3">attach_money</i>
              <span class="responsive-text">Add Payment</span>
            </a>
          </div>
        </div>
      </div>
      <div class="invoice-payment mb-3">
        <div class="invoice-payment-option mb-3">
          <p class="mb-0 mt-3">Accept payments via</p>
          <select name="payment" id="paymentOption">
            <option value="DebitCard">Debit Card</option>
            <option value="DebitCard">Credit Card</option>
            <option value="DebitCard">Paypal</option>
            <option value="DebitCard">Internet Banking</option>
            <option value="DebitCard">UPI Transfer</option>
          </select>
        </div>
        <div class="invoice-terms display-flex flex-column">
          <div class="display-flex justify-content-between pb-2">
            <span>Payment Terms</span>
            <div class="switch">
              <label>
                <input type="checkbox" checked>
                <span class="lever"></span>
              </label>
            </div>
          </div>
          <div class="display-flex justify-content-between pb-2">
            <span>Client Notes</span>
            <div class="switch">
              <label>
                <input type="checkbox" checked>
                <span class="lever"></span>
              </label>
            </div>
          </div>
          <div class="display-flex justify-content-between pb-2">
            <span>Payment Stub</span>
            <div class="switch">
              <label>
                <input type="checkbox">
                <span class="lever"></span>
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
@endsection

{{-- vendor scripts --}}
@section('vendor-script')
<script src="{{asset('vendors/form_repeater/jquery.repeater.min.js')}}"></script>
@endsection

{{-- page scripts --}}
@section('page-script')
<script src="{{asset('js/scripts/app-invoice.js')}}"></script>
@endsection