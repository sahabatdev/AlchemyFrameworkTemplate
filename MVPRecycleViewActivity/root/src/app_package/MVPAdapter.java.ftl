package ${packageName}.module.${activityPackage};

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

<#if isClick>
import android.widget.LinearLayout;
</#if>
import ${packageName}.R;
import ${packageName}.model.${activityPackage}.${activityClass}Response;

import java.util.List;

public class ${activityClass}Adapter extends RecyclerView.Adapter<${activityClass}Adapter.ViewHolder> {
    List<${activityClass}Response> list${activityClass};
    Context context;
    <#if isClick>
    ${activityClass}View mView;
    </#if>

    public ${activityClass}Adapter(Context context, List<${activityClass}Response> list${activityClass}<#if isClick>, ${activityClass}View mView</#if>) {
        this.list${activityClass} = list${activityClass};
        this.context = context;
        <#if isClick>
        this.mView = mView;
        </#if>
    }

    @NonNull
    @Override
    public ${activityClass}Adapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new ViewHolder(LayoutInflater.from(context).inflate(R.layout.item_list_${activityPackage}, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull ${activityClass}Adapter.ViewHolder holder, int position) {
        <#if isClick>final </#if>${activityClass}Response response = list${activityClass}.get(position);
        holder.tvTitle.setText(response.getTitle());
        holder.tvDeskripsi.setText(response.getDescription());

        <#if isClick>
        holder.linearItem${activityClass}.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mView.onClickItem(response);
            }
        });
        </#if>
    }

    @Override
    public int getItemCount() {
        return list${activityClass}.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        TextView tvTitle, tvDeskripsi;
        <#if isClick>
        LinearLayout linearItem${activityClass};
        </#if>
        public ViewHolder(View itemView) {
            super(itemView);
            tvTitle = itemView.findViewById(R.id.tv_title);
            tvDeskripsi = itemView.findViewById(R.id.tv_deskripsi);
            <#if isClick>
            linearItem${activityClass} = itemView.findViewById(R.id.linear_item_${activityPackage});
            </#if>
        }
    }
}
