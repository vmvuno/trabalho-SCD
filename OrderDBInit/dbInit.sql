CREATE DATABASE scdprojetofinal;

\c scdprojetofinal

-- Exclui as tabelas se existirem para permitir a recriação limpa
DROP TABLE IF EXISTS Produtos;
DROP TABLE IF EXISTS Categorias;
DROP TABLE IF EXISTS Marcas;


-- Criação da tabela de Marcas
CREATE TABLE Marcas (
    MarcaID SERIAL PRIMARY KEY,
    NomeMarca VARCHAR(50) NOT NULL UNIQUE
);

-- Criação da tabela de Categorias de Produtos
CREATE TABLE Categorias (
    CategoriaID SERIAL PRIMARY KEY,
    NomeCategoria VARCHAR(50) NOT NULL UNIQUE
);

-- Criação da tabela de Produtos
CREATE TABLE Produtos (
    ProdutoID UUID PRIMARY KEY,
    NomeProduto VARCHAR(100) NOT NULL,
    Descricao VARCHAR(500),
    Preco DECIMAL(10, 2) NOT NULL,
    MarcaID INT,
    CategoriaID INT,
    CONSTRAINT Preco_Positivo CHECK (Preco > 0),
    CONSTRAINT FK_Marca FOREIGN KEY (MarcaID) REFERENCES Marcas(MarcaID),
    CONSTRAINT FK_Categoria FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Criação da tabela de Pedidos
CREATE TABLE Pedidos (
    PedidoID UUID PRIMARY KEY,
    EmailContato VARCHAR(200)
);

-- Criação da tabela de Itens de pedido
CREATE TABLE ItensPedido (
    ItemID SERIAL PRIMARY KEY,
    Quantidade INT,
    ProdutoID UUID,
    PedidoID UUID,
    CONSTRAINT Quantidade_Positiva CHECK (Quantidade > 0),
    CONSTRAINT FK_Produto FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID),
    CONSTRAINT FK_Pedido FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

-- Inserção de Marcas
INSERT INTO Marcas (NomeMarca) VALUES
('Intel'), ('AMD'), ('NVIDIA'), ('Kingston'), ('Samsung'), ('Logitech'), ('Dell'), ('HP'),
('Asus'), ('Gigabyte'), ('MSI'), ('Corsair'), ('Western Digital'), ('Seagate'), ('HyperX'),
('Razer'), ('LG'), ('Acer'), ('Lenovo'), ('Multilaser'), ('TP-Link'), ('D-Link'), ('SanDisk'),
('Crucial'), ('NZXT'), ('Cooler Master'), ('EVGA'), ('BenQ'), ('ViewSonic'), ('Philips'),
('Sony'), ('Xiaomi'), ('Motorola'), ('Apple'), ('Epson'), ('Brother'), ('Microsoft'), ('Positivo'),
('Redragon'), ('Adata'), ('SteelSeries'), ('Roccat'), ('Cougar'), ('Thermaltake'), ('FSP Group'),
('Deepcool'), ('Arctic'), ('JBL'), ('AOC'), ('Lian Li'), ('XPG'), ('Avast'), ('Wacom'), ('Mercusys');

-- Inserção de Categorias
INSERT INTO Categorias (NomeCategoria) VALUES
('Processadores'), ('Placas de Vídeo'), ('Armazenamento'), ('Memória RAM'), ('Periféricos'),
('Monitores'), ('Notebooks'), ('Smartphones'), ('Placas-Mãe'), ('Fontes de Alimentação'),
('Gabinetes'), ('Coolers CPU'), ('Headsets'), ('Teclados'), ('Mouses'), ('Webcams'),
('Roteadores'), ('Adaptadores de Rede'), ('Software'), ('Impressoras'), ('Câmeras'),
('Consoles'), ('Cargos e Acessórios'); -- Adicionei algumas categorias para os novos produtos

-- Inserção de Produtos
INSERT INTO Produtos (NomeProduto, Descricao, Preco, MarcaID, CategoriaID, ProdutoID) VALUES
-- Processadores
('Processador Core i9-13900K', 'Processador Intel de 13ª Geração, 24 Cores, ideal para gaming e produtividade.', 4200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea356f2-4fae-11f0-880d-325096b39f47' ),
('Processador Core i7-13700K', 'Processador Intel de 13ª Geração, 16 Cores, excelente para multitarefas.', 3100.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35760-4fae-11f0-90c7-325096b39f47' ),
('Processador Core i5-13600K', 'Processador Intel de 13ª Geração, 14 Cores, ótimo custo-benefício.', 2300.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea357ce-4fae-11f0-946d-325096b39f47' ),
('Processador Ryzen 9 7950X', 'Processador AMD Zen 4, 16 Cores, alto desempenho para criadores de conteúdo.', 4500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AMD'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35846-4fae-11f0-b472-325096b39f47' ),
('Processador Ryzen 7 7700X', 'Processador AMD Zen 4, 8 Cores, excelente para jogos e aplicações.', 2900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AMD'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea358be-4fae-11f0-9409-325096b39f47' ),
('Processador Ryzen 5 7600X', 'Processador AMD Zen 4, 6 Cores, desempenho sólido para gamers.', 2000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AMD'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea3592c-4fae-11f0-9fb1-325096b39f47' ),
('Processador Core i3-12100', 'Processador Intel de 12ª Geração, 4 Cores, para uso básico e escritório.', 850.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea359a4-4fae-11f0-8e8a-325096b39f47' ),
('Processador Ryzen 3 4100', 'Processador AMD para entrada, 4 Cores, bom para sistemas básicos.', 550.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AMD'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35a12-4fae-11f0-9de8-325096b39f47' ),
('Processador Intel Core i5-12400', 'Processador Intel 12ª Geração, 6 Cores, ideal para gaming.', 1250.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35a80-4fae-11f0-a54a-325096b39f47' ),
('Processador AMD Ryzen 5 5600', 'Processador AMD Zen 3, 6 Cores, ótimo para jogos e produtividade.', 1000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AMD'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35aee-4fae-11f0-8ccc-325096b39f47' ),
('Processador Intel Core i9-12900K', 'Processador Intel 12ª Geração, 16 Cores, alta performance.', 3800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35b66-4fae-11f0-80fc-325096b39f47' ),
('Processador AMD Ryzen 7 5800X3D', 'Processador AMD com 3D V-Cache para gaming extremo.', 2800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AMD'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35bd4-4fae-11f0-bdef-325096b39f47' ),
('Processador Intel Core i7-11700F', 'Processador Intel 11ª Geração, 8 Cores, sem gráficos integrados.', 1500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35c4c-4fae-11f0-9886-325096b39f47' ),
('Processador Intel Core i7-14700K', 'Processador Intel 14ª Geração, 20 Cores, para alta performance.', 3900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35cba-4fae-11f0-8dd6-325096b39f47' ),
('Processador AMD Ryzen 9 7900X', 'Processador AMD Zen 4, 12 Cores, ótimo para multitarefas.', 3800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AMD'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35d32-4fae-11f0-a9b3-325096b39f47' ),
('Processador Intel Core i3-13100', 'Processador Intel 13ª Geração, 4 Cores, bom para entrada.', 950.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35da0-4fae-11f0-950b-325096b39f47' ),
('Processador AMD Ryzen 5 5500', 'Processador AMD Zen 3, 6 Cores, bom custo-benefício.', 800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AMD'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35e18-4fae-11f0-bac5-325096b39f47' ),
('Processador Intel Celeron G6900', 'Processador Intel de entrada para PCs de baixo custo.', 400.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Processadores'), '1ea35e86-4fae-11f0-a2dc-325096b39f47' ),

-- Placas de Vídeo
('Placa de Vídeo RTX 4090', 'NVIDIA GeForce RTX 4090, 24GB GDDR6X, o topo de linha para 4K.', 12000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'NVIDIA'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea35ef4-4fae-11f0-b857-325096b39f47'),
('Placa de Vídeo RTX 4080', 'NVIDIA GeForce RTX 4080, 16GB GDDR6X, excelente desempenho.', 8500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'NVIDIA'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea35f6c-4fae-11f0-8535-325096b39f47'),
('Placa de Vídeo RX 7900 XTX', 'AMD Radeon RX 7900 XTX, 24GB GDDR6, alta performance da AMD.', 7800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AMD'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea35fe4-4fae-11f0-8f50-325096b39f47'),
('Placa de Vídeo RTX 3060', 'NVIDIA GeForce RTX 3060, 12GB GDDR6, ideal para Full HD e QHD.', 2500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'NVIDIA'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea36052-4fae-11f0-af05-325096b39f47'),
('Placa de Vídeo RX 6600', 'AMD Radeon RX 6600, 8GB GDDR6, bom custo-benefício para 1080p.', 1500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AMD'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea360c0-4fae-11f0-9256-325096b39f47'),
('Placa de Vídeo Gigabyte RTX 4070 Ti', 'NVIDIA GeForce RTX 4070 Ti, 12GB GDDR6X.', 5500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Gigabyte'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea3612e-4fae-11f0-aae3-325096b39f47'),
('Placa de Vídeo Asus ROG Strix RX 6800', 'AMD Radeon RX 6800, 16GB GDDR6.', 3800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Asus'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea361a6-4fae-11f0-827a-325096b39f47'),
('Placa de Vídeo MSI GeForce GTX 1660 Super', 'NVIDIA GeForce GTX 1660 Super, 6GB GDDR6.', 1200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'MSI'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea36214-4fae-11f0-9548-325096b39f47'),
('Placa de Vídeo Zotac RTX 3050', 'NVIDIA GeForce RTX 3050, 8GB GDDR6.', 1500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'MSI'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea36282-4fae-11f0-b571-325096b39f47'),
('Placa de Vídeo PowerColor RX 6700 XT', 'AMD Radeon RX 6700 XT, 12GB GDDR6.', 2500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Asus'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea362f0-4fae-11f0-8acb-325096b39f47'),
('Placa de Vídeo Intel Arc A380', 'Placa de vídeo de entrada da Intel para jogos casuais.', 900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Intel'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea3635e-4fae-11f0-9c0b-325096b39f47'),
('Placa de Vídeo MSI RTX 4070 Gaming X Trio', 'NVIDIA GeForce RTX 4070, 12GB GDDR6X, com RGB.', 4800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'MSI'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea363d6-4fae-11f0-b50f-325096b39f47'),
('Placa de Vídeo Asus ROG Strix RX 7800 XT', 'AMD Radeon RX 7800 XT, 16GB GDDR6, para QHD gaming.', 4200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Asus'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea36444-4fae-11f0-8934-325096b39f47'),
('Placa de Vídeo Gigabyte GTX 1650 OC', 'NVIDIA GeForce GTX 1650, 4GB GDDR5, para jogos leves.', 950.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Gigabyte'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas de Vídeo'), '1ea364b2-4fae-11f0-9247-325096b39f47'),

-- Armazenamento
('SSD NVMe M.2 2TB 980 Pro', 'SSD Samsung 980 Pro, alta velocidade para jogos e aplicações.', 1200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Samsung'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36520-4fae-11f0-82ba-325096b39f47'),
('SSD NVMe M.2 1TB SN850X', 'SSD Western Digital Black SN850X, excelente para gaming.', 700.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Western Digital'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36584-4fae-11f0-ba21-325096b39f47'),
('SSD SATA III 500GB A400', 'SSD Kingston A400 SATA III, ótimo para upgrade de PCs mais antigos.', 250.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Kingston'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea365fc-4fae-11f0-929b-325096b39f47'),
('HD Interno 4TB Barracuda', 'HD Seagate Barracuda 4TB, 5400 RPM, para armazenamento em massa.', 450.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Seagate'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea3666a-4fae-11f0-800e-325096b39f47'),
('HD Externo 1TB My Passport', 'HD Externo Western Digital My Passport 1TB, portátil e seguro.', 320.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Western Digital'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea366d8-4fae-11f0-a462-325096b39f47'),
('SSD NVMe M.2 500GB P5 Plus', 'SSD Crucial P5 Plus 500GB, rápido e confiável.', 380.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Crucial'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36746-4fae-11f0-bd24-325096b39f47'),
('SSD Portátil T7 Shield 1TB', 'SSD Portátil Samsung T7 Shield, resistente e de alta velocidade.', 800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Samsung'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea367be-4fae-11f0-8b59-325096b39f47'),
('Pen Drive Ultra Fit 128GB', 'Pen Drive SanDisk Ultra Fit 128GB, compacto e veloz.', 90.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'SanDisk'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea3682c-4fae-11f0-ab3b-325096b39f47'),
('SSD NVMe M.2 4TB Samsung 990 Pro', 'SSD Samsung 990 Pro, ultra-rápido para profissionais.', 2500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Samsung'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea3689a-4fae-11f0-ad6a-325096b39f47'),
('SSD NVMe M.2 500GB Kingston KC3000', 'SSD Kingston KC3000, bom para sistemas operacionais.', 350.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Kingston'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36908-4fae-11f0-a109-325096b39f47'),
('HD Interno 8TB Seagate IronWolf Pro', 'HD Seagate IronWolf Pro 8TB, para NAS e servidores.', 900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Seagate'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36980-4fae-11f0-95aa-325096b39f47'),
('SSD Externo SanDisk Extreme Portable 2TB', 'SSD portátil robusto e veloz.', 1000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'SanDisk'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea369ee-4fae-11f0-a06f-325096b39f47'),
('HD Interno 2TB Western Digital Blue', 'HD Western Digital Blue 2TB, para uso geral.', 300.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Western Digital'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36a5c-4fae-11f0-a2b6-325096b39f47'),
('SSD Sata III 1TB Crucial MX500', 'SSD Crucial MX500, performance e durabilidade.', 500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Crucial'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36b9c-4fae-11f0-8a2a-325096b39f47'),
('SSD M.2 NVMe 1TB P3 Plus Crucial', 'SSD de alta velocidade para notebooks e desktops.', 480.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Crucial'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36c14-4fae-11f0-be6b-325096b39f47'),
('SSD Sata III 240GB Kingston A400', 'SSD de entrada para notebooks e desktops antigos.', 180.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Kingston'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36c82-4fae-11f0-904d-325096b39f47'),
('SSD NVMe M.2 1TB WD Black SN770', 'SSD Western Digital SN770, rápido para jogos e aplicativos.', 580.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Western Digital'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36ce6-4fae-11f0-a870-325096b39f47'),
('SSD SATA III 2TB Samsung 870 EVO', 'SSD Samsung 870 EVO SATA, confiável e espaçoso.', 850.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Samsung'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36d54-4fae-11f0-89c2-325096b39f47'),
('HD Externo 2TB Seagate Expansion Portable', 'HD externo portátil para backup de dados.', 400.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Seagate'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36dcc-4fae-11f0-a5bf-325096b39f47'),
('Pen Drive SanDisk Ultra Dual Drive Luxe USB-C 64GB', 'Pen drive USB-C e USB-A para smartphones e PCs.', 70.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'SanDisk'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36e3a-4fae-11f0-af27-325096b39f47'),
('SSD NVMe M.2 250GB WD Green SN350', 'SSD de entrada para notebooks.', 200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Western Digital'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Armazenamento'), '1ea36eb2-4fae-11f0-a3b8-325096b39f47'),

-- Memória RAM
('Memória RAM 32GB (2x16GB) DDR5 6000MHz', 'Kit Corsair Vengeance DDR5, alto desempenho para plataformas modernas.', 950.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Corsair'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea36f20-4fae-11f0-ba2c-325096b39f47'),
('Memória RAM 16GB (2x8GB) DDR4 3600MHz', 'Kit HyperX Fury Beast DDR4, ideal para gaming.', 450.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HyperX'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea36f98-4fae-11f0-9f5a-325096b39f47'),
('Memória RAM 8GB DDR4 3200MHz', 'Módulo único Kingston Fury Beast DDR4.', 220.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Kingston'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea37006-4fae-11f0-8a0b-325096b39f47'),
('Memória RAM 64GB (2x32GB) DDR5 5600MHz', 'Kit Crucial Pro DDR5, para workstations e PCs de alta performance.', 1800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Crucial'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea37074-4fae-11f0-a90b-325096b39f47'),
('Memória RAM 16GB DDR4 Corsair Vengeance LPX', 'Módulo de memória de baixo perfil para PCs gamers.', 350.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Corsair'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea370ec-4fae-11f0-870d-325096b39f47'),
('Memória RAM 16GB (1x16GB) DDR4 2666MHz', 'Módulo único Kingston para PCs básicos.', 180.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Kingston'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea3715a-4fae-11f0-a7c6-325096b39f47'),
('Memória RAM 32GB (2x16GB) DDR4 3200MHz', 'Kit Corsair Vengeance RGB Pro, com iluminação RGB.', 600.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Corsair'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea371c8-4fae-11f0-a180-325096b39f47'),
('Memória RAM 8GB DDR5 4800MHz', 'Módulo único Crucial DDR5, para novas plataformas.', 280.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Crucial'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea37240-4fae-11f0-b3f6-325096b39f47'),
('Memória RAM 16GB (2x8GB) DDR4 3200MHz HyperX Fury', 'Kit HyperX Fury DDR4, para sistemas gamers.', 420.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HyperX'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea372ae-4fae-11f0-ac81-325096b39f47'),
('Memória RAM 4GB DDR4 2400MHz', 'Módulo simples para PCs de entrada.', 90.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Kingston'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea3731c-4fae-11f0-be36-325096b39f47'),
('Memória RAM 32GB (2x16GB) DDR5 5200MHz Corsair Vengeance', 'Kit DDR5 de alta capacidade e velocidade.', 850.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Corsair'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea37394-4fae-11f0-abf6-325096b39f47'),
('Memória RAM 8GB DDR4 2666MHz Crucial', 'Módulo de memória padrão para PCs desktop.', 170.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Crucial'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea37402-4fae-11f0-ac65-325096b39f47'),
('Memória RAM 16GB (2x8GB) DDR4 3000MHz Kingston Fury Beast', 'Kit DDR4 para PCs gamers.', 390.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Kingston'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), '1ea37470-4fae-11f0-9c46-325096b39f47'),
('Memória RAM 8GB DDR4 2666MHz Kingston ValueRAM', 'Módulo de memória padrão para desktops.', 160.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Kingston'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Memória RAM'), 'ece6ea42-4fae-11f0-b575-325096b39f47'),

-- Periféricos
('Mouse Gamer G502 Hero', 'Mouse Logitech G502 Hero, com 11 botões programáveis e sensor de alta precisão.', 280.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Logitech'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Mouses'), '1ea374de-4fae-11f0-be2b-325096b39f47'),
('Teclado Mecânico BlackWidow V3', 'Teclado gamer Razer BlackWidow V3, switches mecânicos e RGB.', 600.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Razer'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Teclados'), '1ea3754c-4fae-11f0-b5c8-325096b39f47'),
('Headset Cloud Stinger Core', 'Headset HyperX Cloud Stinger Core, leve e confortável para jogos.', 180.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HyperX'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Headsets'), '1ea375c4-4fae-11f0-9c70-325096b39f47'),
('Webcam C920s', 'Webcam Logitech C920s, Full HD 1080p, para chamadas e streaming.', 350.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Logitech'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Webcams'), '1ea37632-4fae-11f0-9d83-325096b39f47'),
('Mouse Sem Fio MX Master 3S', 'Mouse Logitech MX Master 3S, ergonômico e preciso para produtividade.', 550.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Logitech'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Mouses'), '1ea376a0-4fae-11f0-86d4-325096b39f47'),
('Teclado Sem Fio K380', 'Teclado Logitech K380, multi-dispositivo, compacto e confortável.', 220.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Logitech'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Teclados'), '1ea3770e-4fae-11f0-9935-325096b39f47'),
('Headset Kraken X Lite', 'Headset Razer Kraken X Lite, ultra-leve e imersivo.', 250.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Razer'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Headsets'), '1ea37786-4fae-11f0-8391-325096b39f47'),
('Microfone HyperX QuadCast S', 'Microfone gamer HyperX QuadCast S, RGB, para streaming e podcasts.', 800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HyperX'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '1ea377f4-4fae-11f0-aff1-325096b39f47'),
('Teclado Gamer Logitech G Pro X Mecânico', 'Teclado modular com switches personalizáveis.', 750.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Logitech'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Teclados'), '1ea37862-4fae-11f0-86f8-325096b39f47'),
('Mouse Gamer Razer DeathAdder V2', 'Mouse ergonômico com sensor óptico de 20.000 DPI.', 220.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Razer'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Mouses'), '1ea378d0-4fae-11f0-a79c-325096b39f47'),
('Headset Gamer Corsair HS55 Wireless', 'Headset sem fio com áudio imersivo e microfone destacável.', 400.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Corsair'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Headsets'), '1ea37948-4fae-11f0-8888-325096b39f47'),
('Mouse Gamer Redragon Cobra M711', 'Mouse Redragon Cobra, 10.000 DPI, RGB.', 100.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Redragon'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Mouses'), '1ea379b6-4fae-11f0-815f-325096b39f47'),
('Teclado Mecânico HyperX Alloy Origins Core', 'Teclado HyperX TKL, switches mecânicos.', 450.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HyperX'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Teclados'), '1ea37a24-4fae-11f0-a22f-325096b39f47'),
('Headset Gamer SteelSeries Arctis 7+', 'Headset SteelSeries sem fio, áudio 7.1.', 900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'SteelSeries'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Headsets'), '1ea37a92-4fae-11f0-b063-325096b39f47'),
('Webcam Logitech Brio 4K', 'Webcam Logitech 4K UHD, para videoconferências profissionais.', 1200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Logitech'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Webcams'), '1ea37b0a-4fae-11f0-a0e7-325096b39f47'),
('Mouse Gamer Razer Viper Ultimate Wireless', 'Mouse Razer leve e sem fio, com dock de carregamento.', 650.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Razer'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Mouses'), '1ea37b82-4fae-11f0-8e19-325096b39f47'),
('Teclado Mecânico Ducky One 3 SF', 'Teclado Ducky TKL, switches Cherry MX.', 800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Corsair'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Teclados'), '1ea38406-4fae-11f0-87b3-325096b39f47'),
('Headset Astro A50 Wireless + Base Station', 'Headset Astro de alta fidelidade para gamers.', 1500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Logitech'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Headsets'), '1ea384ce-4fae-11f0-aa7f-325096b39f47'),
('Controle Xbox Wireless Carbon Black', 'Controle oficial Xbox para PC e consoles.', 400.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Microsoft'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '1ea38546-4fae-11f0-a185-325096b39f47'),
('Mouse Óptico Logitech M90', 'Mouse básico para uso diário.', 40.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Logitech'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Mouses'), '1ea385be-4fae-11f0-878e-325096b39f47'),
('Teclado Multimídia USB HP K1500', 'Teclado padrão com teclas multimídia.', 60.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HP'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Teclados'), '1ea3862c-4fae-11f0-a809-325096b39f47'),
('Webcam Full HD Logitech C270', 'Webcam básica para videochamadas.', 150.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Logitech'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Webcams'), '43933482-4fae-11f0-935a-325096b39f47'),
('Cabo HDMI 2.0 2 Metros', 'Cabo de alta velocidade para monitores e TVs.', 30.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Multilaser'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '439336f8-4fae-11f0-9f3b-325096b39f47'),
('Filtro de Linha com 5 Tomadas', 'Proteção para equipamentos eletrônicos.', 70.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Multilaser'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '43933798-4fae-11f0-a227-325096b39f47'),
('Fone de Ouvido com Fio Philips SHE1505', 'Fone de ouvido intra-auricular básico.', 25.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Philips'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '4393381a-4fae-11f0-b9c8-325096b39f47'),
('Mousepad Gamer Grande HyperX Fury S Speed Edition', 'Mousepad extra grande para gamers.', 90.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HyperX'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '43933a36-4fae-11f0-96e6-325096b39f47'),
('Controle Xbox Wireless Shock Blue', 'Controle oficial Xbox na cor azul.', 420.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Microsoft'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '43933aa4-4fae-11f0-9e7e-325096b39f47'),
('Controle DualSense PlayStation 5 Midnight Black', 'Controle adicional para PlayStation 5.', 350.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Sony'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '43933afe-4fae-11f0-ba85-325096b39f47'),
('Microfone HyperX QuadCast', 'Microfone USB para streaming e podcasts.', 700.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HyperX'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '43933b62-4fae-11f0-8bfa-325096b39f47'),
('Adaptador USB para HDMI', 'Conecta dispositivos USB a monitores HDMI.', 100.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Multilaser'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '43933bc6-4fae-11f0-99ce-325096b39f47'),
('Cabo de Rede Cat6 5 Metros', 'Cabo Ethernet para conexões de rede.', 40.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Multilaser'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '43933c2a-4fae-11f0-8282-325096b39f47'),
('Mesa Digitalizadora Wacom Intuos Small', 'Mesa digitalizadora para artistas e designers.', 450.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Wacom'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '43933c8e-4fae-11f0-84ea-325096b39f47'),
('Teclado e Mouse Sem Fio Logitech MK270', 'Kit básico de teclado e mouse sem fio.', 180.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Logitech'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Periféricos'), '43933cfc-4fae-11f0-9569-325096b39f47'),
('Fone de Ouvido Bluetooth JBL Wave Buds', 'Fones de ouvido TWS com boa qualidade de áudio.', 250.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'JBL'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Headsets'), '43933d6a-4fae-11f0-8387-325096b39f47'),

-- Monitores
('Monitor Gamer Odyssey G7 27"', 'Monitor Samsung Odyssey G7 27 polegadas, 240Hz, QHD, Curvo.', 2800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Samsung'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '43933dd8-4fae-11f0-8cea-325096b39f47'),
('Monitor Essential S24A410B 24"', 'Monitor Samsung Essential S24A410B, 24 polegadas, Full HD, IPS.', 900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Samsung'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '43933e3c-4fae-11f0-8464-325096b39f47'),
('Monitor Gamer UltraGear 27GN650-B', 'Monitor LG UltraGear 27 polegadas, 144Hz, Full HD, IPS.', 1600.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'LG'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '43933ea0-4fae-11f0-a567-325096b39f47'),
('Monitor Dell P2422H 23.8"', 'Monitor Dell P2422H 23.8 polegadas, Full HD, IPS, USB-C.', 950.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Dell'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '43933f0e-4fae-11f0-92c6-325096b39f47'),
('Monitor BenQ MOBIUZ EX2710S', 'Monitor BenQ MOBIUZ EX2710S 27 polegadas, 165Hz, Full HD.', 1800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'BenQ'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '43933f86-4fae-11f0-a448-325096b39f47'),
('Monitor Gamer Odyssey G5 27"', 'Monitor Samsung QHD curvo, 144Hz.', 1900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Samsung'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '43933ffe-4fae-11f0-97b9-325096b39f47'),
('Monitor LG Ultrawide 29WP500-B 29"', 'Monitor LG ultrawide Full HD IPS.', 1100.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'LG'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '43934062-4fae-11f0-9867-325096b39f47'),
('Monitor Dell S2721HS 27" IPS', 'Monitor Dell Full HD IPS, bordas finas.', 980.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Dell'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '439340bc-4fae-11f0-aeb9-325096b39f47'),
('Monitor BenQ EW2780U 27" 4K HDR', 'Monitor BenQ 4K com HDR e Eye-Care.', 1800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'BenQ'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '43934102-4fae-11f0-b158-325096b39f47'),
('Monitor Dell S2721QS 27" 4K', 'Monitor 4K IPS, excelente para produtividade e design.', 1900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Dell'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '4393413e-4fae-11f0-bc92-325096b39f47'),
('Monitor Gamer AOC Hero 24G2SP 24"', 'Monitor AOC Full HD, 165Hz, IPS.', 1100.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AOC'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '43934184-4fae-11f0-8ef4-325096b39f47'),
('Monitor Samsung Smart M7 32" 4K', 'Monitor Samsung Smart com TV e recursos inteligentes.', 2200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Samsung'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '439341c0-4fae-11f0-9524-325096b39f47'),
('Monitor Gamer AOC Hero 27G2SP 27" 165Hz', 'Monitor gamer Full HD com alta taxa de atualização.', 1400.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'AOC'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Monitores'), '439341fc-4fae-11f0-b4b4-325096b39f47'),

-- Notebooks
('Notebook Dell XPS 15', 'Notebook Dell XPS 15, Core i7, 16GB RAM, 512GB SSD, RTX 3050.', 8000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Dell'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '43934242-4fae-11f0-83e0-325096b39f47'),
('Notebook HP Pavilion Gaming 15', 'Notebook HP Pavilion Gaming 15, Ryzen 7, 16GB RAM, 512GB SSD, GTX 1650.', 4500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HP'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '4393427e-4fae-11f0-b95a-325096b39f47'),
('Notebook Acer Aspire 5', 'Notebook Acer Aspire 5, Core i5, 8GB RAM, 256GB SSD, para uso diário.', 2800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Acer'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '439342c4-4fae-11f0-a95f-325096b39f47'),
('Notebook Lenovo Legion 5 Pro', 'Notebook Lenovo Legion 5 Pro, Ryzen 7, 32GB RAM, 1TB SSD, RTX 3070.', 7000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Lenovo'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '4393430a-4fae-11f0-9319-325096b39f47'),
('MacBook Air M2', 'Notebook Apple MacBook Air M2, 8GB RAM, 256GB SSD, leve e potente.', 7500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Apple'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '43934350-4fae-11f0-acba-325096b39f47'),
('Notebook Gamer Asus ROG Strix G15', 'Notebook Asus, Ryzen 9, 32GB RAM, 1TB SSD, RTX 3070.', 7500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Asus'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '43934396-4fae-11f0-8379-325096b39f47'),
('Notebook Lenovo IdeaPad Gaming 3', 'Notebook Lenovo, Core i5, 8GB RAM, 256GB SSD, GTX 1650.', 3800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Lenovo'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '439343d2-4fae-11f0-a52d-325096b39f47'),
('Notebook HP Envy x360 13"', 'Notebook 2 em 1 HP, Core i7, 16GB RAM, 512GB SSD.', 5200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HP'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '43934418-4fae-11f0-bbff-325096b39f47'),
('Notebook Dell G15 Gaming', 'Notebook Dell, Core i7, 16GB RAM, 512GB SSD, RTX 3060.', 6000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Dell'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '4393445e-4fae-11f0-b2af-325096b39f47'),
('Notebook Acer Nitro 5 AMD', 'Notebook Acer, Ryzen 7, 16GB RAM, 512GB SSD, RX 6600M.', 4800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Acer'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '439344a4-4fae-11f0-b85b-325096b39f47'),
('MacBook Pro 14" M3 Pro', 'Notebook Apple MacBook Pro M3 Pro, 18GB RAM, 512GB SSD.', 12000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Apple'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '439344e0-4fae-11f0-a613-325096b39f47'),
('Notebook Positivo Motion C4500EI', 'Notebook básico para estudos e trabalho.', 1800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Positivo'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '43934526-4fae-11f0-9ae8-325096b39f47'),
('Notebook Dell Inspiron 15', 'Notebook Dell Core i5, 8GB RAM, 256GB SSD.', 3200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Dell'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '43934562-4fae-11f0-8d8f-325096b39f47'),
('Notebook HP 250 G9', 'Notebook HP, Core i3, 4GB RAM, 128GB SSD, para escritório.', 2100.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HP'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '439345a8-4fae-11f0-8d9e-325096b39f47'),
('Notebook Acer Swift 3', 'Notebook Acer, Ryzen 5, 8GB RAM, 512GB SSD, leve e fino.', 3900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Acer'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '439345e4-4fae-11f0-ba4a-325096b39f47'),
('Notebook Lenovo IdeaPad 3', 'Notebook Lenovo, Ryzen 3, 8GB RAM, 256GB SSD.', 2500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Lenovo'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Notebooks'), '4393462a-4fae-11f0-9e73-325096b39f47'),

-- Smartphones
('Samsung Galaxy S24 Ultra', 'Smartphone Samsung Galaxy S24 Ultra, top de linha com câmera avançada.', 8000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Samsung'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Smartphones'), '43934666-4fae-11f0-bd4c-325096b39f47'),
('iPhone 15 Pro Max', 'Smartphone Apple iPhone 15 Pro Max, design premium e performance.', 10000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Apple'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Smartphones'), '439346a2-4fae-11f0-a8cc-325096b39f47'),
('Xiaomi Redmi Note 13 Pro', 'Smartphone Xiaomi Redmi Note 13 Pro, bom custo-benefício.', 1800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Xiaomi'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Smartphones'), '439346e8-4fae-11f0-8ac4-325096b39f47'),
('Smartphone Samsung Galaxy A54', 'Smartphone Samsung intermediário com boa câmera e bateria.', 1900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Samsung'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Smartphones'), '43934724-4fae-11f0-a055-325096b39f47'),
('iPhone 15', 'Smartphone Apple iPhone 15, com chip A16 Bionic.', 6500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Apple'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Smartphones'), '4393476a-4fae-11f0-9221-325096b39f47'),
('Xiaomi Redmi Note 12', 'Smartphone Xiaomi, bom custo-benefício, tela AMOLED.', 1300.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Xiaomi'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Smartphones'), '439347a6-4fae-11f0-92aa-325096b39f47'),
('Bateria Externa Power Bank 10000mAh', 'Carregador portátil para smartphones.', 120.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Xiaomi'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Cargos e Acessórios'), '439347e2-4fae-11f0-85e8-325096b39f47'),

-- Placas-Mãe
('Placa-Mãe Asus ROG Strix Z790-E', 'Placa-mãe para Intel, DDR5, Wi-Fi 6E, PCIe 5.0.', 2500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Asus'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas-Mãe'), '43934828-4fae-11f0-94e7-325096b39f47'),
('Placa-Mãe Gigabyte B650 AORUS Elite AX', 'Placa-mãe para AMD AM5, DDR5, Wi-Fi 6E.', 1500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Gigabyte'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas-Mãe'), '43934864-4fae-11f0-9347-325096b39f47'),
('Placa-Mãe MSI PRO B760M-A WiFi', 'Placa-mãe micro-ATX para Intel, DDR4, Wi-Fi.', 900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'MSI'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas-Mãe'), '439348a0-4fae-11f0-84ba-325096b39f47'),
('Placa-Mãe Gigabyte Z690 AORUS Elite DDR4', 'Placa-mãe para Intel 12ª/13ª Gen, DDR4.', 1600.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Gigabyte'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas-Mãe'), '439348e6-4fae-11f0-8081-325096b39f47'),
('Placa-Mãe MSI PRO B550-VC', 'Placa-mãe para AMD Ryzen, ATX, PCIe 4.0.', 700.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'MSI'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas-Mãe'), '43934922-4fae-11f0-94f7-325096b39f47'),
('Placa-Mãe Asus TUF Gaming X570-Plus', 'Placa-mãe para AMD Ryzen de alta performance.', 1200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Asus'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas-Mãe'), '43934968-4fae-11f0-99dc-325096b39f47'),
('Placa-Mãe Asus Prime Z790-P', 'Placa-mãe para Intel 12ª/13ª/14ª Gen, DDR5.', 1800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Asus'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas-Mãe'), '439349a4-4fae-11f0-8ad3-325096b39f47'),
('Placa-Mãe MSI PRO B650M-A WiFi', 'Placa-mãe micro-ATX para AMD AM5, DDR5.', 1300.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'MSI'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas-Mãe'), '439349e0-4fae-11f0-9f55-325096b39f47'),
('Placa-Mãe Gigabyte A520M DS3H', 'Placa-mãe micro-ATX para AMD Ryzen de entrada.', 550.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Gigabyte'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas-Mãe'), '43934a26-4fae-11f0-b287-325096b39f47'),
('Placa-Mãe Gigabyte H610M H DDR4', 'Placa-mãe para Intel de entrada.', 600.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Gigabyte'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Placas-Mãe'), '43934a62-4fae-11f0-80f0-325096b39f47'),

-- Fontes de Alimentação
('Fonte Corsair RM850e 850W', 'Fonte modular 850W, 80 Plus Gold, silenciosa e eficiente.', 700.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Corsair'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Fontes de Alimentação'), '43934aa8-4fae-11f0-a834-325096b39f47'),
('Fonte EVGA SuperNOVA 750 G6 750W', 'Fonte modular 750W, 80 Plus Gold, alta qualidade.', 600.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'EVGA'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Fontes de Alimentação'), '43934ae4-4fae-11f0-bc0d-325096b39f47'),
('Fonte Corsair RM1000e 1000W', 'Fonte modular 1000W, 80 Plus Gold.', 900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Corsair'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Fontes de Alimentação'), '43934b2a-4fae-11f0-917f-325096b39f47'),
('Fonte Cooler Master MWE Gold 750 V2', 'Fonte não modular 750W, 80 Plus Gold.', 450.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Cooler Master'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Fontes de Alimentação'), '43934b66-4fae-11f0-a680-325096b39f47'),
('Fonte EVGA SuperNOVA 850 G6 850W', 'Fonte 850W, 80 Plus Gold, fully modular.', 750.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'EVGA'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Fontes de Alimentação'), '43934ba2-4fae-11f0-b56d-325096b39f47'),
('Fonte XPG Core Reactor 650W', 'Fonte modular 80 Plus Gold da Adata.', 550.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Adata'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Fontes de Alimentação'), '43934be8-4fae-11f0-81da-325096b39f47'),
('Fonte Cooler Master MWE White 600W', 'Fonte 600W, 80 Plus White, bom custo-benefício.', 320.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Cooler Master'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Fontes de Alimentação'), '43934c2e-4fae-11f0-b8cf-325096b39f47'),
('Fonte Corsair CV550 550W', 'Fonte 550W, 80 Plus Bronze, para PCs básicos.', 280.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Corsair'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Fontes de Alimentação'), '43934c6a-4fae-11f0-bf93-325096b39f47'),
('Fonte de Alimentação 500W 80 Plus White', 'Fonte básica para PCs de entrada.', 250.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'FSP Group'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Fontes de Alimentação'), '43934cb0-4fae-11f0-adf8-325096b39f47'),
('Fonte Gamer Thermaltake Smart Series 600W', 'Fonte 600W com certificação 80 Plus White.', 300.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Thermaltake'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Fontes de Alimentação'), '43934cf6-4fae-11f0-bc5d-325096b39f47'),

-- Gabinetes
('Gabinete NZXT H5 Flow', 'Gabinete Mid-Tower com excelente fluxo de ar.', 650.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'NZXT'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Gabinetes'), '43934d32-4fae-11f0-8a15-325096b39f47'),
('Gabinete Cooler Master MasterBox TD500 Mesh', 'Gabinete Mid-Tower com painel frontal em mesh e RGB.', 550.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Cooler Master'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Gabinetes'), '43934d6e-4fae-11f0-801c-325096b39f47'),
('Gabinete Cooler Master TD500 Mesh V2', 'Gabinete Mid-Tower com frontal em mesh aprimorado.', 600.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Cooler Master'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Gabinetes'), '43934db4-4fae-11f0-bc8b-325096b39f47'),
('Gabinete NZXT H7 Flow', 'Gabinete Mid-Tower com foco em fluxo de ar e design limpo.', 800.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'NZXT'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Gabinetes'), '43934df0-4fae-11f0-8413-325096b39f47'),
('Gabinete Thermaltake H550 TG ARGB', 'Gabinete Mid-Tower com vidro temperado e RGB.', 500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Thermaltake'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Gabinetes'), '43934e36-4fae-11f0-9333-325096b39f47'),
('Gabinete Gamer Cougar MX330', 'Gabinete ATX com painel lateral em vidro.', 300.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Cougar'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Gabinetes'), '43934e72-4fae-11f0-9406-325096b39f47'),
('Gabinete Lian Li Lancool 216', 'Gabinete Mid-Tower com excelente fluxo de ar e fans grandes.', 750.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Lian Li'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Gabinetes'), '43934eae-4fae-11f0-baad-325096b39f47'),
('Gabinete Deepcool CH510', 'Gabinete Mid-Tower com design moderno e painel lateral em vidro.', 480.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Deepcool'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Gabinetes'), '43934ef4-4fae-11f0-ab5a-325096b39f47'),
('Gabinete Gamer Pichau APUS', 'Gabinete Mid-Tower com boa ventilação.', 250.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Multilaser'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Gabinetes'), '43934f30-4fae-11f0-b788-325096b39f47'),

-- Coolers CPU
('Cooler CPU Cooler Master Hyper 212 Black Edition', 'Cooler a ar para CPU, silencioso e eficiente.', 200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Cooler Master'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Coolers CPU'), '43934f76-4fae-11f0-a49b-325096b39f47'),
('Water Cooler Corsair iCUE H150i ELITE CAPELLIX XT', 'Water cooler 360mm, RGB, alta performance.', 1200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Corsair'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Coolers CPU'), '43934fb2-4fae-11f0-8e88-325096b39f47'),
('Cooler CPU Deepcool AG400', 'Cooler a ar torre única, silencioso e eficaz.', 150.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Deepcool'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Coolers CPU'), '43934fee-4fae-11f0-a77a-325096b39f47'),
('Water Cooler NZXT Kraken X63 RGB 280mm', 'Water cooler 280mm, com tela LCD personalizável.', 1000.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'NZXT'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Coolers CPU'), '43935034-4fae-11f0-bbd1-325096b39f47'),
('Cooler CPU Thermalright Phantom Spirit 120 SE', 'Cooler a ar dual tower, alta performance.', 300.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Cooler Master'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Coolers CPU'), '43935070-4fae-11f0-9c67-325096b39f47'),
('Pasta Térmica Arctic MX-4 4g', 'Composto térmico de alta performance para CPUs/GPUs.', 45.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Arctic'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Coolers CPU'), '439350ac-4fae-11f0-9999-325096b39f47'),
('Cooler CPU Deepcool AK500', 'Cooler a ar torre única de alto desempenho.', 280.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Deepcool'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Coolers CPU'), '439350f2-4fae-11f0-b4ea-325096b39f47'),
('Water Cooler Cooler Master MasterLiquid ML240L V2 RGB', 'Water cooler 240mm, com iluminação RGB.', 550.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Cooler Master'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Coolers CPU'), '4393512e-4fae-11f0-bdbf-325096b39f47'),
('Cooler CPU Deepcool AK400 ZERO DARK', 'Cooler a ar com bom desempenho e visual discreto.', 220.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Deepcool'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Coolers CPU'), '4393516a-4fae-11f0-b36c-325096b39f47'),

-- Roteadores e Conectividade
('Roteador TP-Link Archer AX55 AX3000', 'Roteador Wi-Fi 6 dual-band, alta velocidade.', 450.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'TP-Link'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Roteadores'), '439351b0-4fae-11f0-a695-325096b39f47'),
('Roteador Gaming ASUS ROG Rapture GT-AX6000', 'Roteador Wi-Fi 6 para jogos, alta performance.', 1500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Asus'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Roteadores'), '439351ec-4fae-11f0-8319-325096b39f47'),
('Roteador D-Link DIR-841 AC1200', 'Roteador Wi-Fi dual-band, bom para uso doméstico.', 280.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'D-Link'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Roteadores'), '43935232-4fae-11f0-af95-325096b39f47'),
('Roteador TP-Link Archer AXE75 AXE5400 Tri-Band Wi-Fi 6E', 'Roteador Wi-Fi 6E de alta performance.', 700.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'TP-Link'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Roteadores'), '439352e6-4fae-11f0-8ecc-325096b39f47'),
('Roteador Xiaomi AX3000 Wi-Fi 6', 'Roteador Xiaomi com bom custo-benefício.', 350.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Xiaomi'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Roteadores'), '43935322-4fae-11f0-8718-325096b39f47'),
('Adaptador WiFi TP-Link Archer T3U Plus AC1300', 'Adaptador USB Wi-Fi de alta velocidade.', 80.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'TP-Link'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Adaptadores de Rede'), '43935368-4fae-11f0-9d14-325096b39f47'),
('Switch TP-Link TL-SG108 8 Portas Gigabit', 'Switch de rede não gerenciável.', 150.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'TP-Link'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Adaptadores de Rede'), '439353ae-4fae-11f0-bb76-325096b39f47'),
('Adaptador USB Bluetooth 5.0', 'Permite conectar dispositivos Bluetooth ao PC.', 50.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'TP-Link'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Adaptadores de Rede'), '439353f4-4fae-11f0-babf-325096b39f47'),
('Roteador TP-Link Archer C6 AC1200', 'Roteador Wi-Fi AC com tecnologia Mesh.', 350.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'TP-Link'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Roteadores'), '43935430-4fae-11f0-89b6-325096b39f47'),
('Repetidor de Sinal TP-Link RE200 AC750', 'Extensor de alcance Wi-Fi.', 150.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'TP-Link'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Roteadores'), '43935476-4fae-11f0-8b4f-325096b39f47'),
('Roteador Mercusys AC1200', 'Roteador Wi-Fi AC com 4 antenas.', 200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Mercusys'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Roteadores'), '439354b2-4fae-11f0-90e8-325096b39f47'),
('Placa de Rede Gigabit PCIe', 'Placa de rede para desktops.', 80.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'TP-Link'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Adaptadores de Rede'), '439354f8-4fae-11f0-b991-325096b39f47'),

-- Impressoras
('Impressora Multifuncional Epson EcoTank L3250', 'Impressora tanque de tinta com Wi-Fi.', 1300.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Epson'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Impressoras'), '43935534-4fae-11f0-b594-325096b39f47'),
('Impressora Laser Brother HL-L2370DW', 'Impressora laser monocromática com Wi-Fi.', 900.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Brother'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Impressoras'), 'ece6be46-4fae-11f0-913f-325096b39f47'),
('Impressora Multifuncional HP DeskJet Ink Advantage 2774', 'Impressora multifuncional a jato de tinta.', 600.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'HP'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Impressoras'), 'ece6c116-4fae-11f0-9b3a-325096b39f47'),
('Impressora Laser Multifuncional Brother DCP-L2540DW', 'Impressora laser monocromática com scanner e copiadora.', 1500.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Brother'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Impressoras'), 'ece6c1ca-4fae-11f0-a0ef-325096b39f47'),

-- Software
('Sistema Operacional Windows 11 Home (Licença OEM)', 'Licença digital para Windows 11 Home.', 700.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Microsoft'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Software'), 'ece6c2ba-4fae-11f0-a9f0-325096b39f47'),
('Pacote Microsoft Office 365 Personal (1 Ano)', 'Assinatura anual para Office 365.', 350.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Microsoft'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Software'), 'ece6c332-4fae-11f0-a942-325096b39f47'),
('Antivirus Kaspersky Standard (1 Ano, 1 Dispositivo)', 'Proteção contra vírus e malware.', 150.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Avast'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Software'), 'ece6c3a0-4fae-11f0-a5a8-325096b39f47'),
('Sistema Operacional Windows 11 Pro (Licença OEM)', 'Licença digital para Windows 11 Pro.', 1100.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Microsoft'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Software'), 'ece6c418-4fae-11f0-9c97-325096b39f47'),
('Antivirus Avast Premium Security (1 Ano, 3 Dispositivos)', 'Proteção completa para vários dispositivos.', 250.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Avast'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Software'), 'ece6c486-4fae-11f0-8da9-325096b39f47'),

-- Câmeras e Consoles
('Câmera de Segurança Intelbras VIP 1230 B G3', 'Câmera IP Full HD para monitoramento.', 350.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Positivo'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Câmeras'), 'ece6c4fe-4fae-11f0-99d8-325096b39f47'),
('Câmera de Segurança TP-Link Tapo C200 Wi-Fi', 'Câmera IP de segurança com rotação.', 220.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'TP-Link'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Câmeras'), 'ece6c576-4fae-11f0-b00d-325096b39f47'),
('Console de Videogame Sony PlayStation 5 Slim', 'Console de última geração, versão mais compacta.', 4200.00, (SELECT MarcaID FROM Marcas WHERE NomeMarca = 'Sony'), (SELECT CategoriaID FROM Categorias WHERE NomeCategoria = 'Consoles'), 'ece6c5ee-4fae-11f0-a293-325096b39f47');
