with t1 as(select fabd.ad_date, fc.campaign_name, fabd.spend, fabd.impressions, fabd.reach, fabd.clicks, fabd.leads, fabd.value
    from facebook_ads_basic_daily fabd
    inner join facebook_campaign fc on fabd.campaign_id = fc.campaign_id
    inner join facebook_adset fa on fabd.adset_id = fa.adset_id
    union all
    select ad_date, campaign_name, spend, impressions, reach, clicks, leads, value
    from google_ads_basic_daily gabd
)
select ad_date, campaign_name,
    sum(spend) as sum_spend,
    sum(impressions) as sum_impressions,
    sum(clicks) as sum_clicks,
    sum(value) as sum_value
from t1
group by ad_date, campaign_name