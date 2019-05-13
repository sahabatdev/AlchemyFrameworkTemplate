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
</#if>

public class ${activityClass}Presenter {
    ${activityClass}View mView;

    public ${activityClass}Presenter(${activityClass}View mView) {
        this.mView = mView;
    }

    <#if useApi>
    public void doSubmit${activityClass}(<#if auth != 'no'>String auth,</#if>${activityClass}Request request) {
        mView.onShowProgressDialog();
        ApiClient.getClient().POST(<#if auth != 'no'>auth,</#if>request, "${pathApi}").enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                mView.onHideProgressDialog();
                if (response.isSuccessful()) {
                    try {
                        ${activityClass}Response respon = new SahabatHelper<${activityClass}Response>().convertJsonToModel(response.body().string());
                        mView.onSuccessSubmit${activityClass}(respon);
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