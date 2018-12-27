package ${packageName}.module.${activityPackage};

import ${packageName}.R;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import java.util.List;
import android.support.v7.widget.LinearLayoutManager;
import site.sahabatdeveloper.sahabatlibrary.base.BaseActivity;

<#if useApi>
import ${packageName}.model.${activityPackage}.${activityClass}Response;
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

        rv${activityClass} = findViewById(R.id.rv_${activityPackage});
        mPresenter = new ${activityClass}Presenter(this);

        <#if useApi>
        mPresenter.do${activityClass}(<#if method == 'delete'>1</#if><#if method == 'post'><#if method == 'put'>1</#if>new ${activityClass}Request()</#if>);  //TODO Call Presenter to Request API
        </#if>

    }

    @Override
    public void onSuccess${activityClass}(List<${activityClass}Response> response) {
        rv${activityClass}.setLayoutManager(new LinearLayoutManager(this));
        rv${activityClass}.setHasFixedSize(true);
        rv${activityClass}.setAdapter(new ${activityClass}Adapter(this, response));
    }

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

}
