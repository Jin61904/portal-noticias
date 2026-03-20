CREATE DATABASE IF NOT EXISTS portal_noticias;
USE portal_noticias;


DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS sections;
DROP TABLE IF EXISTS authors;

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

CREATE TABLE sections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    section_id INT NOT NULL,
    author_id INT NOT NULL,
    published_at DATETIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_news_section FOREIGN KEY (section_id) REFERENCES sections(id),
    CONSTRAINT fk_news_author FOREIGN KEY (author_id) REFERENCES authors(id)
);
INSERT INTO sections (name)
VALUES ('Deportes'),
    ('Política'),
    ('Social'),
    ('Internacional'),
    ('Cultura'),
    ('Salud');
INSERT INTO authors (name, email)
VALUES ('Fernado Nazario', 'fernado.nazario@example.com'),
    ('Messias Ronaldo', 'messias.ronaldo@example.com'),
    (
        'Cristina Fernández',
        'cristina.fernandez@example.com'
    ),
    ('Laura Rodríguez', 'laura.rodriguez@example.com'),
    ('Miguel Sánchez', 'miguel.sanchez@example.com'),
    ('Sofía Gómez', 'sofia.gomez@example.com'),
    ('Carlos Pérez', 'carlos.perez@example.com'),
    ('Ana Martínez', 'ana.martinez@example.com'),
    ('Jorge López', 'jorge.lopez@example.com'),
    ('María Torres', 'maria.torres@example.com');
INSERT INTO news (
        title,
        image,
        content,
        section_id,
        author_id,
        published_at
    )
VALUES -- DEPORTES
    (
        'Selección nacional muestra un nuevo estilo de juego en amistoso internacional',
        'https://picsum.photos/800/400?random=1',
        'La selección nacional sorprendió a los aficionados con una propuesta táctica renovada en el más reciente partido amistoso. Desde los primeros minutos, el equipo mostró una presión alta, mayor control del balón y una intención clara de construir juego desde la defensa.

El cuerpo técnico ha venido trabajando en una transición generacional que busca integrar jóvenes talentos con jugadores experimentados. Esta mezcla ha permitido generar nuevas dinámicas dentro del campo, especialmente en la zona media, donde se evidenció una mayor fluidez en la circulación del balón.

Además, los delanteros tuvieron múltiples oportunidades de gol, demostrando una mejora significativa en la definición. La defensa, por su parte, mantuvo solidez durante gran parte del encuentro, reduciendo los errores individuales que se habían presentado en partidos anteriores.

Este resultado no solo genera optimismo de cara a las próximas competencias internacionales, sino que también reafirma el proceso que viene adelantando el equipo técnico en la búsqueda de un estilo de juego moderno y competitivo.',
        1,
        1,
        '2026-03-17 10:00:00'
    ),
    (
        'Equipo local clasifica a la final tras una remontada histórica',
        'https://picsum.photos/800/400?random=2',
        'En un partido lleno de emociones, el equipo local logró una remontada que quedará en la memoria de los aficionados. Tras ir perdiendo en el marcador durante gran parte del encuentro, el equipo encontró en los últimos minutos la energía necesaria para cambiar el rumbo del juego.

La clave estuvo en los cambios realizados por el entrenador, quien apostó por un esquema más ofensivo. Los jugadores respondieron con intensidad, generando múltiples oportunidades de gol que finalmente se concretaron.

El estadio fue testigo de un ambiente vibrante, donde la hinchada jugó un papel fundamental impulsando al equipo hasta el último minuto. Este triunfo no solo representa el paso a la final, sino también un reflejo del carácter y la resiliencia del grupo.

Ahora, el equipo se prepara para disputar el título, con la motivación de haber superado una de las pruebas más difíciles de la temporada.',
        1,
        9,
        '2026-03-16 18:30:00'
    ),

    (
        'Debate nacional sobre reforma política genera posiciones divididas',
        'https://picsum.photos/800/400?random=3',
        'El país atraviesa un momento clave en materia política con la discusión de una reforma que busca modificar varios aspectos del sistema electoral. Diversos sectores han manifestado opiniones encontradas frente a las propuestas planteadas.

Por un lado, algunos analistas consideran que la reforma es necesaria para modernizar el sistema y garantizar una mayor transparencia. Por otro, críticos advierten posibles riesgos en la implementación de ciertos cambios que podrían afectar la representación democrática.

El congreso ha sido escenario de intensos debates, en los que se han presentado múltiples modificaciones al texto original. La participación de expertos y organizaciones civiles ha sido fundamental para enriquecer la discusión.

Se espera que en las próximas semanas se definan los puntos clave de la reforma, en un proceso que será determinante para el futuro político del país.',
        2,
        8,
        '2026-03-15 09:00:00'
    ),

    (
        'Cumbre internacional aborda desafíos del cambio climático',
        'https://picsum.photos/800/400?random=4',
        'Líderes de diferentes países se reunieron en una cumbre internacional para discutir estrategias frente al cambio climático. El encuentro destacó la necesidad de fortalecer la cooperación global y acelerar la implementación de políticas sostenibles.

Durante las sesiones, se presentaron avances en energías renovables, reducción de emisiones y protección de ecosistemas. Sin embargo, también se evidenciaron diferencias entre países respecto a los compromisos asumidos.

Expertos coincidieron en que el tiempo es un factor crítico y que las decisiones tomadas en estos espacios tendrán un impacto directo en las futuras generaciones.

La cumbre concluyó con una serie de acuerdos preliminares que deberán ser ratificados en próximos encuentros internacionales.',
        4,
        4,
        '2026-03-14 14:00:00'
    ),

    (
        'Festival cultural impulsa el talento emergente en la región',
        'https://picsum.photos/800/400?random=5',
        'El festival cultural realizado este fin de semana logró reunir a artistas emergentes de diferentes disciplinas. Música, teatro, danza y artes visuales fueron protagonistas de un evento que destacó la diversidad creativa de la región.

Los asistentes pudieron disfrutar de presentaciones en vivo, exposiciones y espacios de interacción con los artistas. Además, se promovieron iniciativas de formación y desarrollo cultural.

Este tipo de eventos no solo fortalecen la identidad cultural, sino que también generan oportunidades económicas para los creadores locales.

La organización ya anunció que planea expandir el festival en futuras ediciones, incluyendo más actividades y participación internacional.',
        5,
        5,
        '2026-03-13 12:00:00'
    ),
    -- SALUD
    (
        'Avances en investigación médica abren nuevas oportunidades de tratamiento',
        'https://picsum.photos/800/400?random=6',
        'Investigadores han anunciado avances significativos en el desarrollo de tratamientos para enfermedades crónicas. Estos resultados son producto de años de estudio y colaboración entre instituciones científicas.

Los nuevos enfoques terapéuticos buscan mejorar la calidad de vida de los pacientes, reduciendo efectos secundarios y aumentando la efectividad de los tratamientos.

Especialistas destacan que, aunque aún quedan etapas por superar, los resultados preliminares son prometedores y podrían transformar la forma en que se abordan ciertas enfermedades.

La comunidad médica continúa trabajando para validar estos avances y garantizar su implementación en sistemas de salud a nivel global.',
        6,
        6,
        '2026-03-12 08:00:00'
    ),
    -- MÁS NOTICIAS PARA LLENAR HOME
    (
        'Ciudad implementa nuevas estrategias de movilidad sostenible',
        'https://picsum.photos/800/400?random=7',
        'La administración local ha anunciado una serie de medidas orientadas a mejorar la movilidad en la ciudad. Estas incluyen la ampliación de ciclorutas, incentivos al uso de transporte público y la implementación de tecnologías inteligentes para la gestión del tráfico.

El objetivo principal es reducir la congestión vehicular y las emisiones contaminantes, promoviendo alternativas más sostenibles para los ciudadanos.

Expertos en urbanismo han destacado la importancia de estas iniciativas, señalando que su éxito dependerá de la participación activa de la comunidad y la continuidad en su implementación.',
        3,
        7,
        '2026-03-11 07:30:00'
    ),
    (
        'Innovaciones tecnológicas marcan tendencia en el sector empresarial',
        'https://picsum.photos/800/400?random=8',
        'El sector empresarial continúa adaptándose a los cambios tecnológicos, incorporando herramientas digitales que optimizan procesos y mejoran la competitividad.

La inteligencia artificial, el análisis de datos y la automatización son algunas de las tendencias que están transformando la forma en que operan las empresas.

Líderes del sector coinciden en que la adopción de estas tecnologías no es una opción, sino una necesidad para mantenerse vigente en un mercado cada vez más dinámico.',
        2,
        3,
        '2026-03-10 16:00:00'
    );