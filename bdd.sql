CREATE DATABASE bdd_cinema

CREATE TABLE cinemas (
    id INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR (50) NOT NULL,
    adresse VARCHAR (255) NOT NULL
);

INSERT INTO cinemas (nom, adresse) VALUES
('Pathé Dock 76', '1 Bd Ferdinand de Lesseps'),
('Omnia République', '28 Rue de la République'),
('Gaumont Grand Quevilly', '26 Bd Pierre Brossolette');


CREATE TABLE utilisateurs (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR (50) NOT NULL,
    prenom VARCHAR (50) NOT NULL,
    email VARCHAR (255) NOT NULL,
    pass CHAR (60) NOT NULL,
    admin TINYINT(1) NOT NULL DEFAULT 0
);

INSERT INTO utilisateurs (nom, prenom, email, pass, admin) VALUES 
('Josseaume', 'Felicien', 'FelicienJosseaume@teleworm.us', 'shoPahso6z', 0),
('Charlebois', 'Mason ', 'MasonCharlebois@jourrapide.com', 'Cely1955', 0),
('Melville', 'Simard', 'MelvilleSimard@rhyta.com', 'aer6sah3aT0', 0),
('Grivois', 'Joy', 'JoyGrivois@jourrapide.com', 'ieca9Eim6ie', 1);

CREATE TABLE clients (
    id INT (11) AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR (50) NOT NULL,
    prenom VARCHAR (50) NOT NULL,
    email VARCHAR (255) NOT NULL,
    pass CHAR (60) NOT NULL,
    tel VARCHAR (70) NOT NULL
);

INSERT INTO clients ( nom, prenom, email, pass, tel) VALUES
('Sanschagrin', 'Nicole', 'NicoleSanschagrin@dayrep.com', 'aidaiK5eeSo', '0000000000'),
('Fayme', 'Raymond','FaymeRaymond@rhyta.com', 'aS0nahbei', '0000000000'),
('Quirion', 'Françoise', 'FrancoiseQuirion@jourrapide.com', 'laichoi4Jee', '0000000000');

CREATE TABLE films (
    id INT (11) AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR (255) NOT NULL,
    genre VARCHAR (70),
    description TEXT
);

INSERT INTO films (titre, genre, description) VALUES
('OPPENHEIMER','Biopic, Historique, Thriller', 'En 1942, convaincus que l’Allemagne nazie est en train de développer une arme nucléaire, les États-Unis initient, dans le plus grand secret, le "Projet Manhattan" destiné à mettre au point la première bombe atomique de l’histoire. Pour piloter ce dispositif, le gouvernement engage J. Robert Oppenheimer, brillant physicien, qui sera bientôt surnommé "le père de la bombe atomique". C’est dans le laboratoire ultra-secret de Los Alamos, au cœur du désert du Nouveau-Mexique, que le scientifique et son équipe mettent au point une arme révolutionnaire dont les conséquences, vertigineuses, continuent de peser sur le monde actuel…'),
('INTERSTELLAR', 'Science fiction, Drame', 'Le film raconte les aventures d’un groupe d’explorateurs qui utilisent une faille récemment découverte dans l’espace-temps afin de repousser les limites humaines et partir à la conquête des distances astronomiques dans un voyage interstellaire. '),
('DJANGO UNCHAINED', 'Western', 'Dans le sud des États-Unis, deux ans avant la guerre de Sécession, le Dr King Schultz, un chasseur de primes allemand, fait l’acquisition de Django, un esclave qui peut l’aider à traquer les frères Brittle, les meurtriers qu’il recherche. Schultz promet à Django de lui rendre sa liberté lorsqu’il aura capturé les Brittle – morts ou vifs. Alors que les deux hommes pistent les dangereux criminels, Django n’oublie pas que son seul but est de retrouver Broomhilda, sa femme, dont il fut séparé à cause du commerce des esclaves..');

CREATE TABLE reservations (
    id INT (11) AUTO_INCREMENT PRIMARY KEY,
    nb_personne INT (50) NOT NULL,
    id_film INT (11) NOT NULL,
    id_client INT (50) NOT NULL,
    FOREIGN KEY (id_film) REFERENCES films(id),
    FOREIGN KEY (id_client) REFERENCES clients(id)
);

INSERT INTO reservations (nb_personne, id_film, id_client) VALUES
(3, 1, 1),
(5, 3, 2),
(1, 2, 3);

CREATE TABLE seances (
    id INT (11) AUTO_INCREMENT PRIMARY KEY,
    horaire VARCHAR (70) NOT NULL,
    jour VARCHAR (70) NOT NULL,
    place_libre VARCHAR (255) NOT NULL
);

INSERT INTO seances (horaire, jour, place_libre) VALUES
('10h45', '05/09/2023', 140),
('13h00', '07/09/2023', 200),
('10h45', '10/09/2023', 90),
('10h45', '14/09/2023', 125);

CREATE TABLE salles (
    id INT (11) AUTO_INCREMENT PRIMARY KEY,
    capacite VARCHAR (255) NOT NULL
);

INSERT INTO salles (capacite) VALUES
(250),
(250),
(250),
(250),
(250);

CREATE TABLE payments (
    id INT (11) AUTO_INCREMENT PRIMARY KEY,
    modalite VARCHAR (200) NOT NULL,
    prix INT (50) NOT NULL
);

INSERT INTO payments (modalite, prix) VALUES
('Plein tarif', '9€20'),
('Étudiant', '7€60'),
('Moins de 14 ans', '5€90');