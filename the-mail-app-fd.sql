with cte as (
	select distinct name,
	p.genres as play_store_genre, a.primary_genre as app_store_genre,
	round((p.rating + a.rating)/2,2) as avg_rating,
	p.review_count as play_store_review_count,
	install_count,
	replace(p.price, '$','')::numeric as price,
	cast(a.review_count as int) as app_store_review_count,
			 
	CASE WHEN p.rating <= .24 THEN '12'
	WHEN p.rating >= .25 AND p.rating <=.74 THEN '24'
	WHEN p.rating >= .75 AND p.rating <=1.24 THEN '36'
	WHEN p.rating >= 1.25 AND p.rating <=1.74 THEN '48'
	WHEN p.rating >= 1.75 AND p.rating <=2.24 THEN '60'
	WHEN p.rating >= 2.25 AND p.rating <2.74 THEN '72'
	WHEN p.rating >= 2.75 AND p.rating <=3.24 THEN '84'
	WHEN p.rating >= 3.25 AND p.rating <=3.74 THEN '96'
	WHEN p.rating >= 3.75 AND p.rating <=4.24 THEN '108'
	WHEN p.rating >= 4.25 AND p.rating <=4.74 THEN '120'
	WHEN p.rating >= 4.75 THEN '132'
	ELSE p.rating :: numeric END AS P_lifespan_months,
	
	CASE WHEN a.rating <= .24 THEN '12'
	WHEN a.rating >= .25 AND a.rating <=.74 THEN '24'
	WHEN a.rating >= .75 AND a.rating <=1.24 THEN '36'
	WHEN a.rating >= 1.25 AND a.rating <=1.74 THEN '48'
	WHEN a.rating >= 1.75 AND a.rating <=2.24 THEN '60'
	WHEN a.rating >= 2.25 AND a.rating <2.74 THEN '72'
	WHEN a.rating >= 2.75 AND a.rating <=3.24 THEN '84'
	WHEN a.rating >= 3.25 AND a.rating <=3.74 THEN '96'
	WHEN a.rating >= 3.75 AND a.rating <=4.24 THEN '108'
	WHEN a.rating >= 4.25 AND a.rating <=4.74 THEN '120'
	WHEN a.rating >= 4.75 THEN '132'
	ELSE p.rating :: numeric END AS A_lifespan_months,
	
	case when replace(p.price, '$','')::numeric <=1 then 10000
	else replace(p.price, '$','')::numeric * 10000
	END as purchase_price,
	
	'9000'::int as monthly_net_revenue
	
from play_store_apps as p
inner join app_store_apps as a using (name)
order by name, p.review_count desc)

select
	distinct name,
	price,
	avg_rating,
	play_store_genre,
	app_store_genre,
	purchase_price, 
	A_lifespan_months,
	P_lifespan_months,
	monthly_net_revenue * round((A_lifespan_months + P_lifespan_months)/2,2) - purchase_price as net_revenue,
-- Rank observations may be made with combinations of fields or solo fields, commenting out as reviewing
-- Apps recommended for purchase based on net_revenue are 10+ years old with a mix of rating & review counts	
	RANK() OVER(ORDER BY avg_rating DESC) AS rating_rank,
	RANK() OVER(ORDER BY app_store_review_count DESC) AS a_review_count_rank
-- Optional Rank fields	
	-- RANK() OVER(ORDER BY play_store_review_count DESC) AS p_review_count_rank
	-- RANK() OVER(ORDER BY A_lifespan_months DESC) AS A_lifespan_rank,
	-- RANK() OVER(ORDER BY P_lifespan_months DESC) AS P_lifespan_rank,
-- Running sum of the Purchase Price and Net Revenue
-- SUM (purchase_price) over (order by purchase_price 
							  -- rows unbounded preceding) as cumulative_purchase_price
FROM cte
order by net_revenue desc, rating_rank
LIMIT 10;