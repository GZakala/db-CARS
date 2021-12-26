﻿    Рад приветствовать приемную комиссию на сдаче моего курсового проекта по тем SQL, базы данных.
    Для увеличения качества проекта я решил объединить приятное с полезным и в качестве темы выбрал клуб любителей классических машин, так как я люблю передачу Top Gear, но, только со старой троицей. В чем же сама цель и суть проекта:
    1) Сделать базу автомобилей, которые находятся в распоряжении клуба;
    2) Составить список клиентов и участников клуба;
    3) Организовать базу хранения совершенных операций (покупок, взятий машин напрокат);
    4) Хранить прошедшие и будущие мероприятия (аукционы, сходки).

Теперь перейдем к самомы устройству БД:

    Таблицы:



------------------------------ cars -----------------------------

В таблице cars прописаны все, имеющиеся в распоряжении клуба, автомобили, с подробной 
информацией о каждой из них. Индексы проставлены по году выпуска, типу топлива и 
максимальной скорости. Внешних ключей нет.



------------------------------ clients -----------------------------

В таблице clients прописаны данные всех клиентов (людей, которые сделали какие-либо покупки). 
Индекс проставлен по фамилии.



------------------------------ price_list -----------------------------

Таблица price_list предоставляет данные о машинах, продаваемых в данный момент с id машины, 
типом продажи и ценой. Первичный ключ проставлен по id машин и типу продажи. Внешний ключ 
ссылается на таблицу cars.



------------------------------ orders -----------------------------

Orders хранит в себе все чек-листы от продаж. Первичный ключ проставлен по id клиента и id машины. 
Индекс стоит на фамилии, а внешний ключ ссылается на cars и clients.



------------------------------ club_members -----------------------------

Эта таблица хранит информацию о всех членах клуба. Индекс проставен по фамилии.



------------------------------ applications -----------------------------

В данной таблице лежат все заявки в членство клуба, если человека принимают, 
то запись должна удаляться.



------------------------------ auctions -----------------------------

Таблица со всеми аукционами.



------------------------------ auction_visitors -----------------------------

Таблица со всеми участниками аукционов. Первичный ключ проставлен по id аукциона
и id участника. Внешние ключи стоят по id аукциона и id члена клуба.



------------------------------ events -----------------------------

Таблица со всеми мероприятиями.



------------------------------ event_visitors -----------------------------

Таблица со всеми участниками мероприятий. Первичный ключ проставлен по id мероприятия
и id участника. Внешние ключи стоят по id мероприятия и id члена клуба.



    Таблицы с логами:

------------------------------ logs_club_auction_event -----------------------------

В эту таблицу записываются логи из таблиц:
club_members, applications, auctions, events, cars, clients.



------------------------------ logs_price_order -----------------------------

В эту таблицу записываются логи из таблиц:
price_list, orders.



------------------------------ logs_visitors -----------------------------

В эту таблицу записываются логи из таблиц:
auction_visitors, event_visitors.



    Представления:


------------------------------ upcoming_events -----------------------------

Дает данные о ближайших или идущих мероприятиях и аукционах.



------------------------------ auto_for_events -----------------------------

Дает список машин, находящихся свободными для продажи или выставки (не купленных).
