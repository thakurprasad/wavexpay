<div id="profile_edit" class="modal modal-fixed-footer">
    <form name="edit-merchant-profile-form" id="edit-merchant-profile-form" method="post" action="{{url('edit-merchant-profile')}}">
        @csrf
    <div class="modal-content">
        <h4>Edit Profile</h4>
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">account_circle</i>
                <input id="display_name" name="display_name" type="text" class="validate">
                <label for="display_name">Display Name</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">phone</i>
                <input id="contact_number" name="contact_number" type="text" class="validate">
                <label for="contact_number">Contact Number</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">account_circle</i>
                <input id="business_name" name="business_name" type="text" class="validate">
                <label for="business_name">Business Name</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">account_circle</i>
                <input id="business_type" name="business_type" type="text" class="validate">
                <label for="business_type">Business Type</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">web</i>
                <input id="additional_website_app" name="additional_website_app" type="text">
                <label for="additional_website_app">Additional Website/App</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">attach_money</i>
                <input id="limit_per_transaction" name="limit_per_transaction" type="text" >
                <label for="limit_per_transaction">limit Per Transaction</label>
            </div>
        </div>
    
    <!-- End Profile Edit Form -->
    </div>
    <div class="modal-footer">
        <button class="modal-action modal-close btn cyan waves-effect waves-light" type="button" name="action">Cancel
            <i class="material-icons right">cancel</i>
        </button>
        <button class="btn cyan waves-effect waves-light" type="submit" name="action">Submit
            <i class="material-icons right">send</i>
        </button>
    </div>
    </form>
</div>