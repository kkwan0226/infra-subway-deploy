create table favorite
(
    id bigint auto_increment
        primary key,
    created_date datetime(6) null,
    modified_date datetime(6) null,
    member_id bigint null,
    source_station_id bigint null,
    target_station_id bigint null
);

create table line
(
    id bigint auto_increment
        primary key,
    created_date datetime(6) null,
    modified_date datetime(6) null,
    color varchar(255) null,
    name varchar(255) null,
    constraint UK_9ney9davbulf79nmn9vg6k7tn
        unique (name)
);

create table member
(
    id bigint auto_increment
        primary key,
    created_date datetime(6) null,
    modified_date datetime(6) null,
    age int null,
    email varchar(255) null,
    password varchar(255) null
);

create table station
(
    id bigint auto_increment
        primary key,
    created_date datetime(6) null,
    modified_date datetime(6) null,
    name varchar(255) null,
    constraint UK_gnneuc0peq2qi08yftdjhy7ok
        unique (name)
);

create table section
(
    id bigint auto_increment
        primary key,
    distance int not null,
    down_station_id bigint null,
    line_id bigint null,
    up_station_id bigint null,
    constraint FK18bw17tb86fh1igov96s9i6he
        foreign key (up_station_id) references station (id),
    constraint FKlfhpg8lrvyr948juittt221ux
        foreign key (line_id) references line (id),
    constraint FKtecjgrtoxbeeqpymapva62xfw
        foreign key (down_station_id) references station (id)
);

create definer = root@`%` procedure CreateSection(IN up varchar(255), IN down varchar(255), IN line varchar(255))
BEGIN
 	 DECLARE up_id INT default 0;
 	 DECLARE down_id INT default 0;
 	 DECLARE line_id INT default 0;

   SET up_id = (SELECT id FROM station WHERE name = up);
   SET down_id = (SELECT id FROM station WHERE name = down);
   SET line_id = (SELECT id FROM line WHERE name = line);
INSERT INTO section VALUES (0, 1, down_id, line_id, up_id);
END;

