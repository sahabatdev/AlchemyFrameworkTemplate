package ${packageName}.module.${activityPackage};

import ${packageName}.R;
import android.os.Bundle;
import site.sahabatdeveloper.sahabatlibrary.base.BaseActivity;
import android.support.design.widget.TabLayout;
import android.support.v4.view.ViewPager;
<#if isToolbarBack>
import android.view.MenuItem;
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
    TabLayout tab${activityClass};
    ViewPager viewPager${activityClass};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});

        getSupportActionBar().setTitle("${activityClass}");
        <#if isToolbarBack>
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        </#if>

        mPresenter = new ${activityClass}Presenter(this);
        tabTab = findViewById(R.id.tab_${activityPackage});
        viewPagerTab = findViewById(R.id.view_pager_${activityPackage});

        //Set Pageradapter dengan ViewPager
        setupWithPager(viewPager${activityClass});
        tab${activityClass}.setupWithViewPager(viewPager${activityClass});

    }

    //Fungsi untuk memasangkan PagerAdapter dengan ViewPager
    private void setupWithPager(ViewPager viewPagerTab) {
        ViewPagerAdapter adapter = new ViewPagerAdapter(getSupportFragmentManager());
        adapter.addFragment(new ${fragment1Class}Fragment(), "${fragment1Class}");
        adapter.addFragment(new ${fragment2Class}Fragment(), "${fragment2Class}");
        viewPagerTab.setAdapter(adapter);
    }

    <#if useApi>
    @Override
    public void onSuccess${activityClass}(${activityClass}Response response) {
        Log.d("RESPONSE", new SahabatHelper<${activityClass}Response>().convertModelToJson(response));
    }
    </#if>

    @Override
    public void onMessage(String s) {
        getUserInterface().showMessageToast(s);
    }

    @Override
    public void onShowProgressDialog() {
        getLoading().showLoadingDialog();
    }

    @Override
    public void onHideProgressDialog() {
        getLoading().hideLoadingDialog();
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
