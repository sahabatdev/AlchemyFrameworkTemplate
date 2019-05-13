package ${packageName}.module.${activityPackage};

import ${packageName}.R;
import android.os.Bundle;
import site.sahabatdeveloper.sahabatlibrary.base.BaseActivity;
import com.daimajia.slider.library.SliderLayout;
import com.daimajia.slider.library.SliderTypes.TextSliderView;
<#if isToolbarBack>
import android.view.MenuItem;
</#if>
<#if useApi>
<#if auth != 'no'>
import android.util.Base64;
</#if>
import java.util.List;
import android.util.Log;
import site.sahabatdeveloper.sahabatlibrary.helper.SahabatHelper;
import ${packageName}.model.${activityPackage}.${activityClass}Response;
</#if>

public class ${activityClass}Activity extends BaseActivity implements ${activityClass}View{

    ${activityClass}Presenter mPresenter;
    SliderLayout sliderShow;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});

        getSupportActionBar().setTitle("${activityClass}");

        <#if isToolbarBack>
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        </#if>

        mPresenter = new ${activityClass}Presenter(this);

        sliderShow = findViewById(R.id.slider);

        <#if useApi>
        mPresenter.getSlider${activityClass}(<#if auth == 'basic'>"Basic " + Base64.encodeToString(("${basicUserPassword}").getBytes(),Base64.DEFAULT)</#if><#if auth == 'bearer'>"Bearer "+ Base64.encodeToString(("${bearerToken}").getBytes(),Base64.DEFAULT)</#if>);
        </#if>

        <#if !useApi>
        TextSliderView textSliderView = new TextSliderView(this);
        textSliderView
                .description("Game of Thrones")
                .image("http://images.boomsbeat.com/data/images/full/19640/game-of-thrones-season-4-jpg.jpg");

        sliderShow.addSlider(textSliderView);
        </#if>
    }

    <#if useApi>
    @Override
    public void onSuccess${activityClass}(List<${activityClass}Response> response) {
        for (${activityClass}Response item : response) {
            TextSliderView textSliderView = new TextSliderView(this);
            textSliderView
                    .description(item.getDeskripsi())
                    .image(item.getImage());

            sliderShow.addSlider(textSliderView);
        }
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
