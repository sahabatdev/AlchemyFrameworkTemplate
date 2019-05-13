package ${packageName}.module.${activityPackage};

import java.io.IOException;

<#if useApi>
import ${packageName}.network.ApiClient;
import site.sahabatdeveloper.sahabatlibrary.helper.SahabatHelper;
import ${packageName}.model.${activityPackage}.${activityClass}Response;
import ${packageName}.model.${activityPackage}.${activityClass}Request;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import java.util.List;
</#if>

public class ${activityClass}Presenter {
    ${activityClass}View mView;

    public ${activityClass}Presenter(${activityClass}View mView) {
        this.mView = mView;
    }

    <#if useApi>
    public void getSlider${activityClass}(<#if auth != 'no'>String auth,</#if>) {
        mView.onShowProgressDialog();
        ApiClient.getClient().GET(<#if auth != 'no'>auth,</#if>"${pathApi}").enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                mView.onHideProgressDialog();
                if (response.isSuccessful()) {
                    try {
                        List<${activityClass}Response> respon = new SahabatHelper<List<${activityClass}Response>>().convertJsonToModel(response.body().string());
                        mView.onSuccess${activityClass}(respon);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } else {
                    try {
                        mView.onMessage(response.errorBody().string());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                mView.onHideProgressDialog();
                mView.onMessage(t.getLocalizedMessage());
            }
        });
    }
    </#if>

}