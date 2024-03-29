-- -- This script was generated by the ERD tool in pgAdmin 4.
-- -- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
-- BEGIN;


-- CREATE TABLE IF NOT EXISTS libromatricula.course_change_log
-- (
--     id_log_course integer NOT NULL DEFAULT nextval('libromatricula.matricula_log_course_id_log_course_seq'::regclass),
--     id_matricula integer NOT NULL,
--     id_old_course integer NOT NULL,
--     old_list_number integer,
--     old_assignment_date date,
--     id_new_course integer NOT NULL,
--     new_list_number integer,
--     new_assignment_date date,
--     period integer NOT NULL,
--     date_change timestamp without time zone NOT NULL DEFAULT now(),
--     id_responsible_user integer NOT NULL,
--     CONSTRAINT matricula_log_course_pkey PRIMARY KEY (id_log_course)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.cuenta_usuario
-- (
--     id_cuenta_usuario serial NOT NULL,
--     nombre_cuenta_usuario character varying(80) COLLATE pg_catalog."default" NOT NULL,
--     clave_cuenta_usuario character varying(32) COLLATE pg_catalog."default" NOT NULL,
--     id_funcionario integer NOT NULL,
--     id_privilegio integer NOT NULL,
--     id_estado integer NOT NULL DEFAULT 1,
--     fecha_creacion_cuenta timestamp without time zone DEFAULT now(),
--     fecha_modificacion_cuenta timestamp without time zone DEFAULT now(),
--     fecha_acceso timestamp without time zone,
--     CONSTRAINT cuenta_usuario_pkey PRIMARY KEY (id_cuenta_usuario)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.lista_sae
-- (
--     id_registro serial NOT NULL,
--     rut_estudiante character varying(10) COLLATE pg_catalog."default" NOT NULL,
--     periodo_matricula integer NOT NULL,
--     grado_matricula integer NOT NULL,
--     estudiante_nuevo boolean,
--     CONSTRAINT lista_sae_pkey PRIMARY KEY (id_registro)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.periodo_matricula
-- (
--     id_periodo serial NOT NULL,
--     anio_lectivo integer NOT NULL,
--     estado boolean NOT NULL DEFAULT false,
--     fecha_inicio_clases date,
--     permitir_modificar_fecha boolean DEFAULT false,
--     autocorrelativo_listas boolean DEFAULT true,
--     fecha_modificacion timestamp without time zone,
--     CONSTRAINT periodo_matricula_pkey PRIMARY KEY (id_periodo)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.registro_apoderado
-- (
--     id_apoderado serial NOT NULL,
--     rut_apoderado character varying(10) COLLATE pg_catalog."default" NOT NULL,
--     dv_rut_apoderado character varying(1) COLLATE pg_catalog."default" NOT NULL,
--     apellido_paterno_apoderado character varying(40) COLLATE pg_catalog."default" NOT NULL,
--     apellido_materno_apoderado character varying(40) COLLATE pg_catalog."default" NOT NULL,
--     nombres_apoderado character varying(80) COLLATE pg_catalog."default" NOT NULL,
--     telefono_apoderado character varying(20) COLLATE pg_catalog."default",
--     direccion_apoderado character varying(200) COLLATE pg_catalog."default",
--     fecha_registro_apoderado timestamp without time zone DEFAULT now(),
--     fecha_modificacion_apoderado timestamp without time zone DEFAULT now(),
--     CONSTRAINT registro_apoderado_pkey PRIMARY KEY (id_apoderado),
--     CONSTRAINT unique_rut_apoderado UNIQUE (rut_apoderado)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.registro_curso
-- (
--     id_curso serial NOT NULL,
--     grado_curso integer NOT NULL,
--     letra_curso character varying(1) COLLATE pg_catalog."default" NOT NULL,
--     periodo_escolar integer NOT NULL,
--     id_docente_jefe integer,
--     id_paradocente integer,
--     id_inspectoria_general integer,
--     numero_lista_curso integer NOT NULL DEFAULT 1,
--     CONSTRAINT registro_curso_pkey PRIMARY KEY (id_curso)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.registro_estado
-- (
--     id_estado serial NOT NULL,
--     estado character varying(100) COLLATE pg_catalog."default" NOT NULL,
--     CONSTRAINT registro_estado_pkey PRIMARY KEY (id_estado)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.registro_estudiante
-- (
--     id_estudiante serial NOT NULL,
--     rut_estudiante character varying(10) COLLATE pg_catalog."default" NOT NULL,
--     dv_rut_estudiante character varying(1) COLLATE pg_catalog."default" NOT NULL,
--     apellido_paterno_estudiante character varying(40) COLLATE pg_catalog."default" NOT NULL,
--     apellido_materno_estudiante character varying(40) COLLATE pg_catalog."default" NOT NULL,
--     nombres_estudiante character varying(120) COLLATE pg_catalog."default" NOT NULL,
--     nombre_social_estudiante character varying(40) COLLATE pg_catalog."default",
--     fecha_nacimiento_estudiante date,
--     sexo_estudiante character varying(1) COLLATE pg_catalog."default",
--     fecha_registro_estudiante timestamp without time zone NOT NULL DEFAULT now(),
--     fecha_modificacion_estudiante timestamp without time zone NOT NULL DEFAULT now(),
--     CONSTRAINT registro_estudiante_pkey PRIMARY KEY (id_estudiante),
--     CONSTRAINT unique_rut_estudiante UNIQUE (rut_estudiante)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.registro_funcionario
-- (
--     id_funcionario serial NOT NULL,
--     rut_funcionario character varying(10) COLLATE pg_catalog."default" NOT NULL,
--     dv_rut_funcionario character varying(1) COLLATE pg_catalog."default" NOT NULL,
--     apellido_paterno_funcionario character varying(40) COLLATE pg_catalog."default" NOT NULL,
--     apellido_materno_funcionario character varying(40) COLLATE pg_catalog."default" NOT NULL,
--     nombres_funcionario character varying(120) COLLATE pg_catalog."default" NOT NULL,
--     sexo_funcionario character varying(1) COLLATE pg_catalog."default",
--     fecha_nacimiento_funcionario date,
--     id_estado_funcionario integer NOT NULL DEFAULT 1,
--     id_tipo_funcionario integer,
--     id_departamento integer,
--     correo_funcionario character varying(80) COLLATE pg_catalog."default",
--     fecha_creacion_funcionario timestamp without time zone NOT NULL DEFAULT now(),
--     fecha_modificacion_funcionario timestamp without time zone NOT NULL DEFAULT now(),
--     CONSTRAINT registro_funcionario_pkey PRIMARY KEY (id_funcionario),
--     CONSTRAINT unique_rut_funcionario UNIQUE (rut_funcionario)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.registro_matricula
-- (
--     id_registro_matricula serial NOT NULL,
--     numero_matricula integer NOT NULL,
--     id_estudiante integer NOT NULL,
--     id_apoderado_titular integer,
--     id_apoderado_suplente integer,
--     grado integer NOT NULL,
--     id_curso integer,
--     numero_lista_curso integer,
--     fecha_matricula date NOT NULL,
--     fecha_alta_matricula date,
--     anio_lectivo_matricula integer NOT NULL,
--     id_estado_matricula integer NOT NULL DEFAULT 2,
--     fecha_registro_matricula timestamp without time zone NOT NULL DEFAULT now(),
--     fecha_modificacion_matricula timestamp without time zone NOT NULL DEFAULT now(),
--     fecha_baja_matricula date,
--     id_usuario_responsable integer,
--     CONSTRAINT registro_matricula_pkey PRIMARY KEY (id_registro_matricula)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.registro_privilegio
-- (
--     id_privilegio serial NOT NULL,
--     privilegio character varying(50) COLLATE pg_catalog."default" NOT NULL,
--     descripcion_privilegio character varying(200) COLLATE pg_catalog."default" NOT NULL,
--     CONSTRAINT registro_privilegio_pkey PRIMARY KEY (id_privilegio)
-- );

-- CREATE TABLE IF NOT EXISTS libromatricula.student_withdrawal_log
-- (
--     id_log_whithdrawal serial NOT NULL,
--     id_matricula integer NOT NULL,
--     whitdrawal_date date NOT NULL,
--     registration_date timestamp without time zone DEFAULT now(),
--     id_responsible_user integer NOT NULL,
--     CONSTRAINT student_withdrawal_log_pkey PRIMARY KEY (id_log_whithdrawal)
-- );
-- END;