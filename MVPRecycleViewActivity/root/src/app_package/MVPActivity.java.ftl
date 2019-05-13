package ${packageName}.module.${activityPackage};

import ${packageName}.R;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import java.util.List;
import android.support.v7.widget.LinearLayoutManager;
import site.sahabatdeveloper.sahabatlibrary.base.BaseActivity;
<#if isToolbarBack>
import android.view.MenuItem;
</#if>

<#if useApi>
import ${packageName}.model.${activityPackage}.${activityClass}Response;
<#if auth != 'no'>
import android.util.Base64;
</#if>
<#if method == 'post' || method == 'put'>
import ${packageName}.model.${activityPackage}.${activityClass}Request;
</#if>
</#if>

public class ${activityClass}Activity extends BaseActivity implements ${activityClass}View{

    ${activityClass}Presenter mPresenter;
    RecyclerView rv${activityClass};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});

        <#if isToolbarBack>
        getSupportActionBar().setTitle("${activityClass}");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        </#if>

        rv${activityClass} = findViewById(R.id.rv_${activityPackage});
        mPresenter = new ${activityClass}Presenter(this);

        <#if useApi>
        mPresenter.do${activityClass}(<#if method == 'get'><#if auth == 'basic'>"Basic " + Base64.encodeToString(("${basicUserPassword}").getBytes(),Base64.DEFAULT)</#if><#if auth == 'bearer'>"Bearer "+ Base64.encodeToString(("${bearerToken}").getBytes(),Base64.DEFAULT)</#if></#if><#if method == 'delete'><#if auth == 'basic'>"Basic " + Base64.encodeToString(("${basicUserPassword}").getBytes(),Base64.DEFAULT),</#if><#if auth == 'bearer'>"Bearer "+ Base64.encodeToString(("${bearerToken}").getBytes(),Base64.DEFAULT),</#if>1</#if><#if method == 'post' || method == 'put'><#if auth == 'basic'>"Basic " + Base64.encodeToString(("${basicUserPassword}").getBytes(),Base64.DEFAULT),</#if><#if auth == 'bearer'>"Bearer "+ Base64.encodeToString(("${bearerToken}").getBytes(),Base64.DEFAULT),</#if><#if method == 'put'>1,</#if>new ${activityClass}Request()</#if>);  //TODO Call Presenter to Request API
        </#if>

    }

    @Override
    public void onSuccess${activityClass}(List<${activityClass}Response> response) {
        rv${activityClass}.setLayoutManager(new LinearLayoutManager(this));
        rv${activityClass}.setHasFixedSize(true);
        rv${activityClass}.setAdapter(new ${activityClass}Adapter(this, response<#if isClick> ,this</#if>));
    }

    <#if isClick>
    @Override
    public void onClickItem(${activityClass}Response response) {
        Bundle bundle = new Bundle();
        bundle.putString("title",response.getTitle());
        bundle.putString("detail",response.getDetail());

        //TODO Create Activity DetailCobaActivity with Template MVP Empty View
        launchActivity(Detail${activityClass}Activity.class, bundle);
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
