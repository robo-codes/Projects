select datepart(dw,billdate) as 'Day Of Week', sum(totalprice) as 'Total Price'
from orderlines
group by datepart(dw, billdate)
order by 'Day of Week';


select year([start_date]) as Year,
sum(case when channel = 'Chain' then 1 else 0 end) as Chain,
sum(case when channel = 'Dealer' then 1 else 0 end) as Dealer,
sum(case when channel = 'Mail' then 1 else 0 end) as Mail,
sum(case when channel = 'Store' then 1 else 0 end) as Store
from Subscribers
where year([start_date]) in (2004,2005,2006)
group by year([start_date])
order by year([start_date]);


select year([start_date]) as Year,
sum(case when channel = 'Chain' then 1 else 0 end) as Start_Chain,
sum(case when channel = 'Dealer' then 1 else 0 end) as Start_Dealer,
sum(case when channel = 'Mail' then 1 else 0 end) as Start_Mail,
sum(case when channel = 'Store' then 1 else 0 end) as Start_Store
from Subscribers
where year([start_date]) in (2004,2005,2006)
group by year([start_date])
order by year([start_date]);
select year([start_date]) as Year,
sum(case when channel = 'Chain' then 1 else 0 end) as Stop_Chain,
sum(case when channel = 'Dealer' then 1 else 0 end) as Stop_Dealer,
sum(case when channel = 'Mail' then 1 else 0 end) as Stop_Mail,
sum(case when channel = 'Store' then 1 else 0 end) as Stop_Store
from Subscribers
where year([start_date]) in (2004,2005,2006)
group by year([start_date])
order by year([start_date]);


select month([start_date]) as Month,
sum(case when [rate_plan] = 'Top' then 1 else 0 end) as Topmost,
sum(case when [rate_plan] = 'Middle' then 1 else 0 end) as Middle,
sum(case when [rate_plan] = 'Bottom' then 1 else 0 end) as Bottom
from Subscribers
where year([start_date]) in (2004,2005,2006) and [censored] = 1
group by month([start_date])
order by month([start_date]);


select (year([stop_date])-year([start_date])) as 'Calculated Tenure', Sum([monthly_fee]) as MonthlyFee
from Subscribers
where [censored] = 0 and year([start_date]) >= 2004
group by (year([stop_date])-year([start_date]))