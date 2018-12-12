package ${packageName}.module.${activityPackage};

import ${packageName}.R;
import android.os.Bundle;
import site.sahabatdeveloper.sahabatlibrary.base.BaseActivity;

public class ${activityClass}Activity extends BaseActivity implements ${activityClass}View{

    ${activityClass}Presenter mPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});

        mPresenter = new ${activityClass}Presenter(this);

        <#if useApi>
        mPresenter.do${activityClass}(<#if method == 'delete'>1</#if><#if method == 'post'><#if method == 'put'>1</#if>new SaldoRequest()</#if>);  //TODO Call Presenter to Request API
        </#if>

    }

}
