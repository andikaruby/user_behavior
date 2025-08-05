select * 
from 
(-- tansaction table
	SELECT	*, id, 
	FROM transactions_data 
) ch
left join 
(-- entitas di user_data table
	select id, current_age, retirement_age, birth_year, birth_month, gender, address, latitude, longitude, longitude, per_capita_income, yearly_income, total_debt, credit_score, num_credit_cards 
		--coba kita show all dulu nanti baru kita lihat di requirement BRDnya kyk gimana.
	-- case when case_type='isi_kompleks_dari_case_kyk_gimana' then 'Lolos Credit Score' else 'Tidak Lolos Credit Score' end 'Bisa Dipertimbangkan'
	from users_data 
		where credit_score >= '700'
) cl on ch.id = cl.id
left join 
(-- entitas di cards_data table
	select id, client_id, card_brand, card_type, card_number, expires, cvv, has_chip, num_card_issued, credit_limit, acc_open_date, year_pin_last_change, card_on_dark_web
	from cards_data 
		-- where card_type='credit' -- kita taro kondisi yang munculnya type credit saja, ini jika diminta
) doc1 on ch.id=doc1.id
order by 1 asc
