package ${packageName}.module.${activityPackage};

import ${packageName}.R;
import android.os.Bundle;
import site.sahabatdeveloper.sahabatlibrary.base.BaseActivity;
<#if isToolbarBack>
import android.view.MenuItem;
</#if>
<#if tipeLayout == 'detail'>
import android.widget.TextView;
</#if>
<#if useApi>
<#if auth != 'no'>
import android.util.Base64;
</#if>
import android.util.Log;
import site.sahabatdeveloper.sahabatlibrary.helper.SahabatHelper;
import ${packageName}.model.${activityPackage}.${activityClass}Response;
<#if method == 'post' || method == 'put'>
import ${packageName}.model.${activityPackage}.${activityClass}Request;
</#if>
</#if>

public class ${activityClass}Activity extends BaseActivity implements ${activityClass}View{

    ${activityClass}Presenter mPresenter;
    <#if tipeLayout == 'detail'>
    TextView tvTitle, tvDetail;
    </#if>


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});

        <#if isToolbarBack>
        <#if tipeLayout == 'empty'>
        getSupportActionBar().setTitle("${activityClass}");
        </#if>
        <#if tipeLayout == 'detail'>
        getSupportActionBar().setTitle("Detail ${activityClass}");
        </#if>
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        </#if>

        mPresenter = new ${activityClass}Presenter(this);
        <#if tipeLayout == 'detail'>
        tvTitle = findViewById(R.id.tv_title);
        tvDetail = findViewById(R.id.tv_detail);

        if(getIntent().getExtras()!=null){
            tvTitle.setText(getIntent().getExtras().getString("title"));
            tvDetail.setText(getIntent().getExtras().getString("detail"));
        }
        </#if>

        <#if useApi>
        mPresenter.do${activityClass}(<#if method == 'get'><#if auth == 'basic'>"Basic " + Base64.encodeToString(("${basicUserPassword}").getBytes(),Base64.DEFAULT)</#if><#if auth == 'bearer'>"Bearer "+ Base64.encodeToString(("${bearerToken}").getBytes(),Base64.DEFAULT)</#if></#if><#if method == 'delete'><#if auth == 'basic'>"Basic " + Base64.encodeToString(("${basicUserPassword}").getBytes(),Base64.DEFAULT),</#if><#if auth == 'bearer'>"Bearer "+ Base64.encodeToString(("${bearerToken}").getBytes(),Base64.DEFAULT),</#if>1</#if><#if method == 'post' || method == 'put'><#if auth == 'basic'>"Basic " + Base64.encodeToString(("${basicUserPassword}").getBytes(),Base64.DEFAULT),</#if><#if auth == 'bearer'>"Bearer "+ Base64.encodeToString(("${bearerToken}").getBytes(),Base64.DEFAULT),</#if><#if method == 'put'>1,</#if>new ${activityClass}Request()</#if>);  //TODO Call Presenter to Request API
        </#if>

    }

    <#if useApi>
    @Override
    public void onSuccess${activityClass}(${activityClass}Response response) {
        Log.d("RESPONSE", new SahabatHelper<${activityClass}Response>().convertModelToJson(response));
    }
    </#if>

    @Override
    public void onMessage(String s) {
        toastMessage(s);
    }

    @Override
    public void onShowProgressDialog() {
        showProgressDialog();
    }

    @Override
    public void onHideProgressDialog() {
        hideProgressDialog();
    }

    <#if isToolbarBack>
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if(item.getItemId()==android.R.id.home){
            onBackPressed();
        }

        return super.onOptionsItemSelected(item);
    }
    </#if>

}
