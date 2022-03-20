CREATE DATABASE userregister;

Use userregister;

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
    quest_id bigint auto_increment,
    text     varchar(255) not null,
    poll_id  bigint       not null,
    constraint question_id_uindex
        unique (quest_id),
    constraint question_poll_id_fk
        foreign key (poll_id) references poll (id)
            on delete cascade
);

alter table question
    add primary key (quest_id);

create table answer
(
    id          bigint auto_increment,
    ans_text    varchar(255)     not null,
    weight      bigint default 0 not null,
    question_id bigint           not null,
    constraint answer_id_uindex
        unique (id),
    constraint answer_question_id_fk
        foreign key (question_id) references question (quest_id)
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
    constraint result_id_uindex
        unique (id),
    constraint result_poll_id_fk
        foreign key (poll_id) references poll (id)
            on delete cascade
);

alter table results
    add primary key (id);



INSERT INTO poll(name, description) VALUES ( 'Aaron Beck Depression Scale', 'The Beck Depression Scale is used to diagnose the level of depression. The Beck Depression Inventory was proposed by Aaron T. Beck in 1961 based on clinical observations that revealed a list of symptoms of depression. After comparing this list with clinical descriptions of depression, a depression test questionnaire was created, which includes 21 statements of the most common symptoms and complaints. Each item of the questionnaire consists of 4-5 statements corresponding to specific manifestations/symptoms of depression. These statements are ranked as the proportion of the symptom to the overall severity of depression increases.');

INSERT INTO question(text, poll_id) VALUES ( 'What is your emotional state?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I don''t feel upset, sad', '0', 1);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I''m sad', '1', 1);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I''m frustrated all the time and can''t turn it off', '2', 1);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I''m so upset and unhappy that I can''t stand it', '3', 1);

INSERT INTO question(text, poll_id) VALUES ( 'What do you think about your future?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I don''t worry about my future', '0', 2);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I feel like I''m puzzled by the future', '1', 2);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I feel like there''s nothing in store for me in the future', '2', 2);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('My future is hopeless and nothing can change for the better', '3', 2);

INSERT INTO question(text, poll_id) VALUES ( 'Rate your success', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I don''t feel like a failure', '0', 3);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I feel like I''ve failed more than other people.', '1', 3);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('When I look back at my life, I see many failures in it.', '2', 3);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I feel like I''m a complete failure as a person.', '3', 3);

INSERT INTO question(text, poll_id) VALUES ( 'How satisfied are you with your life?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I get as much satisfaction from life as before', '0', 4);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I don''t get as much satisfaction from life as I used to', '1', 4);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I no longer get satisfaction from anything', '2', 4);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I am completely dissatisfied with life and I''m tired of everything', '3', 4);

INSERT INTO question(text, poll_id) VALUES ( 'How often do you feel guilty?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I don''t feel guilty about anything', '0', 5);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('Quite often I feel guilty', '1', 5);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('Most of the time I feel guilty', '2', 5);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I constantly feel guilty', '3', 5);

INSERT INTO question(text, poll_id) VALUES ( 'Do you feel the possibility of being punished?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I don''t feel like I can be punished for anything', '0', 6);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I feel that I can be punished', '1', 6);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I expect to be punished', '2', 6);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I feel already punished', '3', 6);

INSERT INTO question(text, poll_id) VALUES ( 'Your attitude towards yourself', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I am not disappointed in myself', '0', 7);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I''m disappointed in myself', '1', 7);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I am disgusted with myself', '2', 7);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I hate myself', '3', 7);

INSERT INTO question(text, poll_id) VALUES ( 'Self-accusation', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I know that I am not worse than others', '0', 8);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I criticize myself for mistakes and weaknesses', '1', 8);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I blame myself all the time for my actions', '2', 8);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I blame myself for everything bad that happens', '3', 8);

INSERT INTO question(text, poll_id) VALUES ( 'Do you have suicidal thoughts?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I never thought about killing myself', '0', 9);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('Thoughts of suicide come to me, but I will not carry them out', '1', 9);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I would like to commit suicide', '2', 9);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I would kill myself if the opportunity presented itself.', '3', 9);

INSERT INTO question(text, poll_id) VALUES ( 'What is your level of irritability?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('Now I''m no more irritable than usual', '0', 10);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I get irritated more easily than before', '1', 10);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('Now I constantly feel irritated', '2', 10);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I became indifferent to things that used to annoy me', '3', 10);

INSERT INTO question(text, poll_id) VALUES ( 'What is your level of interest in people?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I have not lost interest in other people', '0', 11);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I am less interested in other people than before', '1', 11);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I almost lost interest in other people', '2', 11);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I completely lost interest in other people', '3', 11);

INSERT INTO question(text, poll_id) VALUES ( 'Making decisions', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I put off making a decision sometimes, just like before', '0', 12);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I delay making decisions more often than before.', '1', 12);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I find it harder to make decisions than before', '2', 12);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I can no longer make decisions', '3', 12);

INSERT INTO question(text, poll_id) VALUES ( 'How do you rate your appearance?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I don''t feel like I look worse than usual', '0', 13);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('It worries me that I look old and unattractive', '1', 13);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I know that there have been significant changes in my appearance that make me unattractive', '2', 13);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I know that I look ugly', '3', 13);

INSERT INTO question(text, poll_id) VALUES ( 'Rate your productivity', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I can work just as well as before', '0', 14);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I need to make an extra effort to start doing something', '1', 14);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I can hardly force myself to do anything', '2', 14);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I can''t do any work at all', '3', 14);

INSERT INTO question(text, poll_id) VALUES ( 'Do you have sleep problems?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I sleep just as well as before', '0', 15);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('Now I sleep worse than before', '1', 15);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I wake up 1-2 hours early and find it hard to get back to sleep', '2', 15);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I wake up a few hours earlier than usual and can''t get back to sleep', '3', 15);

INSERT INTO question(text, poll_id) VALUES ( 'How often do you feel tired?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I''m no more tired than usual', '0', 16);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('Now I get tired faster than before', '1', 16);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I get tired of almost everything I do', '2', 16);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I can''t do anything because I''m tired', '3', 16);

INSERT INTO question(text, poll_id) VALUES ( 'How has your appetite changed?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('My appetite is not worse than usual', '0', 17);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('My appetite is worse than before', '1', 17);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('My appetite is much worse now', '2', 17);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I have no appetite at all', '3', 17);

INSERT INTO question(text, poll_id) VALUES ( 'How has your weight changed?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I haven''t lost any weight lately or the weight loss has been negligible', '0', 18);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('Lately I have lost over 2 kg', '1', 18);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I have lost over 5 kg', '2', 18);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I have lost over 7 kr', '3', 18);

INSERT INTO question(text, poll_id) VALUES ( 'Are you worried about your health?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I worry about my health no more than usual', '0', 19);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I am concerned about my physical health problems such as pain, indigestion, constipation, etc.', '1', 19);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I am very concerned about my physical condition and find it hard to think of anything else.', '2', 19);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I''m so concerned about my physical condition that I can''t think of anything else.', '3', 19);

INSERT INTO question(text, poll_id) VALUES ( 'How has your libido changed?', '1');
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I haven''t noticed a change in my interest in intimacy lately.', '0', 20);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I''m less interested in intimacy issues than before', '1', 20);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('Now I''m much less interested in inter-gender relationships than before.', '2', 20);
INSERT INTO answer(ans_text, weight, question_id)VALUES ('I completely lost my libido', '3', 20);

INSERT INTO results(explanation, min_score, max_score, poll_id) VALUES ( 'No depressive symptoms', '0', '9', '1');
INSERT INTO results(explanation, min_score, max_score, poll_id) VALUES ( 'Mild depression (sub-depression)', '10', '15', '1');
INSERT INTO results(explanation, min_score, max_score, poll_id) VALUES ( 'Moderate depression', '16', '19', '1');
INSERT INTO results(explanation, min_score, max_score, poll_id) VALUES ( 'Severe depression (moderate)', '20', '29', '1');
INSERT INTO results(explanation, min_score, max_score, poll_id) VALUES ( 'Severe depression', '30', '63', '1');

