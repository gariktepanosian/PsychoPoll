CREATE DATABASE epam_learn;

Use epam_learn;

create table employee
(
    id         int auto_increment,
    first_name varchar(40)  null,
    email      varchar(40)  null,
    username   varchar(250) null,
    password   varchar(20)  null,
    address    varchar(40)  null,
    contact    varchar(40)  null,
    constraint employee_id_uindex
        unique (id)
);

alter table employee
    add primary key (id);

create table poll
(
    id          bigint auto_increment,
    name        varchar(255) not null,
    description text         null,
    constraint poll_id_uindex
        unique (id)
);

alter table poll
    add primary key (id);

create table question
(
    id      bigint auto_increment,
    text    varchar(255) not null,
    poll_id bigint       not null,
    constraint question_id_uindex
        unique (id),
    constraint question_poll_id_fk
        foreign key (poll_id) references poll (id)
            on delete cascade
);

alter table question
    add primary key (id);

create table answer
(
    id          bigint auto_increment,
    text        varchar(255)     not null,
    weight      bigint default 0 not null,
    question_id bigint           not null,
    constraint answer_id_uindex
        unique (id),
    constraint answer_question_id_fk
        foreign key (question_id) references question (id)
            on delete cascade
);

alter table answer
    add primary key (id);

create table results
(
    id          bigint auto_increment,
    explanation varchar(255)     not null,
    min_score   bigint default 0 not null,
    max_score   bigint default 0 not null,
    poll_id     bigint           not null,
    constraint results_id_uindex
        unique (id),
    constraint results_poll_id_fk
        foreign key (poll_id) references poll (id)
            on delete cascade
);

alter table results
    add primary key (id);



INSERT INTO poll(NAME, DESCRIPTION) VALUES ( 'Шкала депресии Аарона Бека', 'Методика Шкала депрессии Бека используется для диагностики уровня депрессии. Тест-опросник депрессии (Beck Depression Inventory) был предложен Аароном Т. Беком в 1961 году на основе клинических наблюдений, позволивших выявить перечень симптомов депрессии. После сравнения этого списка с клиническими описаниями депрессии, был создан тест-опросник депрессии, включающий в себя 21 вопрос-утверждение наиболее часто встречаемых симптомов и жалоб. Каждый пункт опросника состоит из 4-5 утверждений, соответствующих специфическим проявлениям/симптомам депрессии. Эти утверждения ранжированы по мере увеличения удельного веса симптома в общей степени тяжести депрессии.');

INSERT INTO question(text, poll_id) VALUES ( 'Каково Ваше эмоциональное состояние?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я не чувствую себя расстроенным, печальным', '0', 1);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я расстроен', '1', 1);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я все время расстроен и не могу от этого отключиться', '2', 1);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я настолько расстроен и несчастлив, что не могу это выдержать', '3', 1);

INSERT INTO question(text, poll_id) VALUES ( 'Что вы думаете о вашем будущем?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я не тревожусь о своем будущем', '0', 2);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я чувствую, что озадачен будущим', '1', 2);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я чувствую, что меня ничего не ждет в будущем', '2', 2);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Мое будущее безнадежно, и ничто не может измениться к лучшему', '3', 2);

INSERT INTO question(text, poll_id) VALUES ( 'Оцените вашу успешность', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я не чувствую себя неудачником', '0', 3);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я чувствую, что терпел больше неудач, чем другие люди', '1', 3);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Когда я оглядываюсь на свою жизнь, я вижу в ней много неудач', '2', 3);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я чувствую, что как личность я - полный неудачник', '3', 3);

INSERT INTO question(text, poll_id) VALUES ( 'На сколько вы удовлетворены своей жизнью?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я получаю столько же удовлетворения от жизни, как раньше', '0', 4);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я не получаю столько же удовлетворения от жизни, как раньше', '1', 4);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я больше не получаю удовлетворения ни от чего', '2', 4);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я полностью не удовлетворен жизнью и мне все надоело', '3', 4);

INSERT INTO question(text, poll_id) VALUES ( 'Как часто у вас возникает чувство вины?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я не чувствую себя в чем-нибудь виноватым', '0', 5);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Достаточно часто я чувствую себя виноватым', '1', 5);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Большую часть времени я чувствую себя виноватым', '2', 5);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я постоянно испытываю чувство вины', '3', 5);

INSERT INTO question(text, poll_id) VALUES ( 'Чувствуете ли вы возможность быть наказанным?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я не чувствую, что могу быть наказанным за что-либо', '0', 6);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я чувствую, что могу быть наказан', '1', 6);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я ожидаю, что могу быть наказан', '2', 6);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я чувствую себя уже наказанным', '3', 6);

INSERT INTO question(text, poll_id) VALUES ( 'Ваше отношение к себе', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я не разочаровался в себе', '0', 7);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я разочаровался в себе', '1', 7);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я себе противен', '2', 7);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я себя ненавижу', '3', 7);

INSERT INTO question(text, poll_id) VALUES ( 'Самообвинение', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я знаю, что я не хуже других', '0', 8);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я критикую себя за ошибки и слабости', '1', 8);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я все время обвиняю себя за свои поступки', '2', 8);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я виню себя во всем плохом, что происходит', '3', 8);

INSERT INTO question(text, poll_id) VALUES ( 'У вас бывают мысли о самоубийстве?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я никогда не думал покончить с собой', '0', 9);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Ко мне приходят мысли покончить с собой, но я не буду их осуществлять', '1', 9);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я хотел бы покончить с собой', '2', 9);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я бы убил себя, если бы представился случай', '3', 9);

INSERT INTO question(text, poll_id) VALUES ( 'Каков уровень вашей раздражительности?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Сейчас я раздражителен не более, чем обычно', '0', 10);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я более легко раздражаюсь, чем раньше', '1', 10);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Теперь я постоянно чувствую, что раздражен', '2', 10);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я стал равнодушен к вещам, которые меня раньше раздражали', '3', 10);

INSERT INTO question(text, poll_id) VALUES ( 'Каков уровень вашего интереса к людям?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я не утратил интереса к другим людям', '0', 11);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я меньше интересуюсь другими людьми, чем раньше', '1', 11);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я почти потерял интерес к другим людям', '2', 11);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я полностью утратил интерес к другим людям', '3', 11);

INSERT INTO question(text, poll_id) VALUES ( 'Принятие решений', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я откладываю принятие решения иногда, как и раньше', '0', 12);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я чаще, чем раньше, откладываю принятие решения', '1', 12);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Мне труднее принимать решения, чем раньше', '2', 12);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я больше не могу принимать решения', '3', 12);

INSERT INTO question(text, poll_id) VALUES ( 'Как вы оцениваете вашу внешность?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я не чувствую, что выгляжу хуже, чем обычно', '0', 13);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Меня тревожит, что я выгляжу старым и непривлекательным', '1', 13);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я знаю, что в моей внешности произошли существенные изменения, делающие меня непривлекательным', '2', 13);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я знаю, что выгляжу безобразно', '3', 13);

INSERT INTO question(text, poll_id) VALUES ( 'Оцените вашу продуктивность', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я могу работать так же хорошо, как и раньше', '0', 14);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Мне необходимо сделать дополнительное усилие, чтобы начать делать что-нибудь', '1', 14);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я с трудом заставляю себя делать что-либо', '2', 14);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я совсем не могу выполнять никакую работу', '3', 14);

INSERT INTO question(text, poll_id) VALUES ( 'Есть ли у вас проблемы со сном?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я сплю так же хорошо, как и раньше', '0', 15);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Сейчас я сплю хуже, чем раньше', '1', 15);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я просыпаюсь на 1-2 часа раньше, и мне трудно заснуть опять', '2', 15);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я просыпаюсь на несколько часов раньше обычного и больше не могу заснуть', '3', 15);

INSERT INTO question(text, poll_id) VALUES ( 'Как часто вы чувствуете усталость?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я устаю не больше, чем обычно', '0', 16);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Теперь я устаю быстрее, чем раньше', '1', 16);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я устаю почти от всего, что я делаю', '2', 16);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я не могу ничего делать из-за усталости', '3', 16);

INSERT INTO question(text, poll_id) VALUES ( 'Как изменился вашь аппетит?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Мой аппетит не хуже, чем обычно', '0', 17);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Мой аппетит стал хуже, чем раньше', '1', 17);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Мой аппетит теперь значительно хуже', '2', 17);
INSERT INTO answer(text, weight, question_id) VALUES ( 'У меня вообще нет аппетита', '3', 17);

INSERT INTO question(text, poll_id) VALUES ( 'Как изменился вашь вес?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'В последнее время я не похудел или потеря веса была незначительной', '0', 18);
INSERT INTO answer(text, weight, question_id) VALUES ( 'За последнее время я потерял более 2 кг', '1', 18);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я потерял более 5 кг', '2', 18);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я потерял более 7 кr', '3', 18);

INSERT INTO question(text, poll_id) VALUES ( 'Тревожитесь ли вы о своем здоровье?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я беспокоюсь о своем здоровье не больше, чем обычно', '0', 19);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Меня тревожат проблемы моего физического здоровья, такие, как боли, расстройство желудка, запоры и т.д', '1', 19);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я очень обеспокоен своим физическим состоянием, и мне трудно думать о чем-либо другом', '2', 19);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я настолько обеспокоен своим физическим состоянием, что больше ни о чем не могу думать', '3', 19);

INSERT INTO question(text, poll_id) VALUES ( 'Как изменилось ваше либидо?', '1');
INSERT INTO answer(text, weight, question_id) VALUES ( 'В последнее время я не замечал изменения своего интереса к близости', '0', 20);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Меня меньше занимают проблемы близости, чем раньше', '1', 20);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Сейчас я значительно меньше интересуюсь межполовыми отношениями, чем раньше', '2', 20);
INSERT INTO answer(text, weight, question_id) VALUES ( 'Я полностью утратил либидо интерес', '3', 20);

INSERT INTO results(explanation, min_score, max_score, poll_id) VALUES ( 'Отсутствие депрессивных симптомов', '0', '9', '1');
INSERT INTO results(explanation, min_score, max_score, poll_id) VALUES ( 'Легкая депрессия (субдепрессия)', '10', '15', '1');
INSERT INTO results(explanation, min_score, max_score, poll_id) VALUES ( 'Умеренная депрессия', '16', '19', '1');
INSERT INTO results(explanation, min_score, max_score, poll_id) VALUES ( 'Выраженная депрессия (средней тяжести)', '20', '29', '1');
INSERT INTO results(explanation, min_score, max_score, poll_id) VALUES ( 'Тяжёлая депрессия', '30', '63', '1');

