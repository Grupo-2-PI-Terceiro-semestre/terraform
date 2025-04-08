USE order_hub;

INSERT INTO categoria (nome)
VALUES ('Salões de Beleza');
INSERT INTO categoria (nome)
VALUES ('Barbearias');
INSERT INTO categoria (nome)
VALUES ('Manicure & Nail Designer');
INSERT INTO categoria (nome)
VALUES ('Esteticistas');
INSERT INTO categoria (nome)
VALUES ('Sobrancelhas & Cílios');

INSERT INTO funcao (nome_funcao)
VALUES ('Cabelereiro');
INSERT INTO funcao (nome_funcao)
VALUES ('Barbeiro');
INSERT INTO funcao (nome_funcao)
VALUES ('Manicure');
INSERT INTO funcao (nome_funcao)
VALUES ('Esteticista');
INSERT INTO funcao (nome_funcao)
VALUES ('Recepcionista');

-- Endereços para as empresas
INSERT INTO endereco (bairro, cep, cidade, complemento, estado, logradouro, numero)
VALUES
    ('Cerqueira César', '01414-001', 'São Paulo', 'Apto 456', 'SP', 'Rua Haddock Lobo', '595'),
    ('Centro', '20010-000', 'Rio de Janeiro', 'Sala 101', 'RJ', 'Av. Presidente Vargas', '1000'),
    ('Savassi', '30112-010', 'Belo Horizonte', 'Loja 5', 'MG', 'Rua Pernambuco', '123'),
    ('Boa Viagem', '51020-010', 'Recife', 'Casa', 'PE', 'Rua dos Navegantes', '456'),
    ('Batel', '80420-090', 'Curitiba', 'Conjunto 1203', 'PR', 'Av. Batel', '789'),
    ('Jardim Goiás', '74810-010', 'Goiânia', 'Qd. 45 Lt. 10', 'GO', 'Av. Jamel Cecílio', '250'),
    ('Praia do Canto', '29055-250', 'Vitória', 'Bloco B', 'ES', 'Rua Aleixo Neto', '100'),
    ('Asa Sul', '70390-010', 'Brasília', 'Edifício Brasília Center', 'DF', 'SQS 202', '3'),
    ('Trindade', '88036-000', 'Florianópolis', 'Cobertura', 'SC', 'Rua Lauro Linhares', '890'),
    ('Meireles', '60160-150', 'Fortaleza', 'Apartamento 802', 'CE', 'Av. Beira Mar', '555'),
    ('Vila Mariana', '04018-001', 'São Paulo', 'Sala 204', 'SP', 'Rua Vergueiro', '1001');

INSERT INTO empresa (fk_endereco, fk_categoria, url_logo, cnpj, email_empresa, nome_empresa, telefone)
VALUES (1, 2, 'https://storage.googleapis.com/udois-261822.appspot.com/imagens-templates/thumbnail_1735372022031662324a1938845.webp', '96541975000104',
        'contato1@minhanovaempresa.com', 'Barber Mania', '+5511999999999');

insert into imagem (fk_empresa, url_imagem)
values (1, 'https://www.goldhairmoveis.com.br/wp-content/uploads/2016/11/excelencia-no-salao-de-beleza.jpg'),
       (1, 'https://s2.glbimg.com/Ha2q-YYa3pCWtwM4E51zi_p-POI=/940x523/e.glbimg.com/og/ed/f/original/2019/02/20/blow-dry-bar-del-mar-chairs-counter-853427.jpg'),
       (1, 'https://frizzar.com.br/blog/wp-content/uploads/2022/07/moveis-em-sala-de-beleza-compressed-1024x571.jpg'),
       (1, 'https://contabilidaderm.com.br/wp-content/uploads/2023/07/Analise-Financeira-para-Salao-de-Beleza.jpg');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES (1, 50.00, 'Corte',
        'Corte de cabelo masculino e feminino, com técnicas modernas e estilo personalizado para cada cliente.',
        '#4A90E2', '01:00:00', 'ATIVO');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES (1, 30.00, 'Barba',
        'Barba feita com navalha, incluindo modelagem e acabamento, para um visual impecável e sofisticado.', '#7ED321',
        '00:30:00', 'ATIVO');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES (1, 20.00, 'Bigode',
        'Modelagem do bigode, com detalhes e acabamentos que destacam a sua personalidade e estilo.', '#F5A623',
        '00:30:00', 'ATIVO');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES (1, 25.00, 'Descoloração',
        'Descoloração de bigode, com produtos de alta qualidade que garantem a saúde dos pelos e um resultado duradouro.',
        '#D0021B', '02:30:00', 'ATIVO');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES (1, 55.00, 'Combo',
        'Corte e barba, combinando as melhores técnicas de barbearia para um resultado final excepcional.', '#9013FE',
        '02:00:00', 'ATIVO');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES (1, 70.00, 'Pacote Completo',
        'Pacote completo com corte de cabelo, barba e tratamento facial, para um dia de cuidados especiais e relaxamento.',
        '#F8E71C', '03:00:00', 'ATIVO');


INSERT INTO usuarios(fk_empresa, fk_endereco, representante, tipos_de_usuario, cpf, email_pessoa,
                     firebase_uid, fk_funcao, nome_pessoa, numero_telefone, senha, status_atividade)
    VALUES (1, 1, 1, 0, 98260012014, 'joao.silva@example.com', '', 1, 'João da Silva', NULL,
        '$2a$10$jTFvRNxv.JBvUvLtCFSeR.UY2O/ugXv.kKYOIuKnwz4GgHKxzRIN.', 'ATIVO');


INSERT INTO agenda(fk_usuario)
VALUES (1);

-- Serviços para a Empresa 1

INSERT INTO empresa (fk_endereco, fk_categoria, url_logo, cnpj, email_empresa, nome_empresa, telefone)
VALUES (2, 1, 'https://marketplace.canva.com/EAE_pF9jQO8/1/0/1600w/canva-logotipo-circular-vintage-floral-terracota-para-est%C3%A9tica-e-beleza-isR0zH2IodY.jpg', '66325467000110',
        'contato@belezaexpress.com', 'Beleza Express', '+5511988887777');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES
    (2, 80.00, 'Escova Progressiva', 'Alisamento profissional para cabelos de todos os tipos.', '#FF5733', '02:00:00', 'ATIVO'),
    (2, 60.00, 'Hidratação Capilar', 'Tratamento intenso para cabelos secos e danificados.', '#C70039', '01:00:00', 'ATIVO'),
    (2, 50.00, 'Corte Feminino', 'Corte moderno e personalizado para mulheres.', '#FFBD33', '01:00:00', 'ATIVO'),
    (2, 45.00, 'Corte Masculino', 'Corte estilizado para homens.', '#8B008B', '00:45:00', 'ATIVO'),
    (2, 90.00, 'Penteado Especial', 'Penteados para ocasiões especiais.', '#00CED1', '01:30:00', 'ATIVO');

-- Serviços para a Empresa 2

INSERT INTO empresa (fk_endereco, fk_categoria, url_logo, cnpj, email_empresa, nome_empresa, telefone)
VALUES (3, 2, 'https://s3-sa-east-1.amazonaws.com/projetos-artes/fullsize%2F2022%2F05%2F03%2F14%2FLogo-282869_335130_140920012_1113390457.jpg', '66325467000110',
        'contato@barberking.com', 'Barber King', '+5511977776666');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES
    (3, 45.00, 'Corte Degradê', 'Corte moderno e estiloso com acabamento perfeito.', '#581845', '01:00:00', 'ATIVO'),
    (3, 30.00, 'Barba Navalhada', 'Barba feita com navalha para um acabamento impecável.', '#DAA520', '00:30:00', 'ATIVO'),
    (3, 50.00, 'Combo Corte + Barba', 'Pacote completo com corte e barba.', '#B22222', '01:30:00', 'ATIVO'),
    (3, 20.00, 'Bigode Modelado', 'Modelagem precisa para destacar o bigode.', '#228B22', '00:30:00', 'ATIVO'),
    (3, 60.00, 'Relaxamento Capilar', 'Relaxamento para controle de volume e cachos.', '#4682B4', '01:30:00', 'ATIVO');

-- Serviços para a Empresa 3

INSERT INTO empresa (fk_endereco, fk_categoria, url_logo, cnpj, email_empresa, nome_empresa, telefone)
VALUES (4, 3, 'https://img.irroba.com.br/fit-in/600x600/filters:fill(fff):quality(80)/kreative/catalog/adesivos-parede-manciure/mod-1601/adesivo-parede-manicure-pedicure-ref-1601-foto-1.JPG', '66325467000110',
        'contato@topmanicure.com', 'Top Manicure', '+5511966665555');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES
    (4, 25.00, 'Unhas Decoradas', 'Decoração artística de unhas com alta qualidade.', '#DAF7A6', '00:45:00', 'ATIVO'),
    (4, 20.00, 'Cutilagem', 'Remoção de cutículas com cuidado e precisão.', '#FA8072', '00:30:00', 'ATIVO'),
    (4, 30.00, 'Esmaltação em Gel', 'Unhas duradouras com acabamento brilhante.', '#FFD700', '01:00:00', 'ATIVO'),
    (4, 40.00, 'Spa para Pés', 'Hidratação e cuidados especiais para os pés.', '#40E0D0', '01:00:00', 'ATIVO'),
    (4, 35.00, 'Manicure Completa', 'Pacote completo com cutilagem, esmaltação e hidratação.', '#8A2BE2', '01:15:00', 'ATIVO');

-- Serviços para a Empresa 4

INSERT INTO empresa (fk_endereco, fk_categoria, url_logo, cnpj, email_empresa, nome_empresa, telefone)
VALUES (5, 4, 'https://artpoin.com/wp-content/uploads/2019/11/132213-scaled.png', '66325467000110',
        'contato@esteticanova.com', 'Estética Nova', '+5511955554444');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES
    (5, 100.00, 'Limpeza de Pele', 'Limpeza profunda para remoção de impurezas da pele.', '#FFC300', '01:30:00', 'ATIVO'),
    (5, 120.00, 'Peeling Facial', 'Tratamento para renovação da pele.', '#CD5C5C', '01:00:00', 'ATIVO'),
    (5, 80.00, 'Hidratação Facial', 'Hidratação intensa para uma pele mais saudável.', '#4682B4', '00:45:00', 'ATIVO'),
    (5, 150.00, 'Tratamento Anti-Aging', 'Redução de linhas de expressão e rejuvenescimento.', '#8B4513', '02:00:00', 'ATIVO'),
    (5, 200.00, 'Massagem Corporal', 'Massagem relaxante para alívio de tensões.', '#FF69B4', '01:30:00', 'ATIVO');

-- Serviços para a Empresa 5

INSERT INTO empresa (fk_endereco, fk_categoria, url_logo, cnpj, email_empresa, nome_empresa, telefone)
VALUES (6, 5, 'https://i.pinimg.com/736x/ec/6d/f6/ec6df648a26bc7dcf282cf0d65786040.jpg', '66325467000110',
        'contato@sobrancelhaplus.com', 'Sobrancelha Plus', '+5511944443333');

INSERT INTO servico (fk_empresa, valor_servico, nome_servico, descricao, cor_referencia_hex, duracao, status_atividade)
VALUES
    (6, 40.00, 'Design de Sobrancelhas', 'Design especializado para sobrancelhas.', '#581845', '00:30:00', 'ATIVO'),
    (6, 50.00, 'Henna', 'Aplicação de henna para realce das sobrancelhas.', '#2F4F4F', '00:45:00', 'ATIVO'),
    (6, 70.00, 'Micropigmentação', 'Técnica de preenchimento semipermanente.', '#9932CC', '02:00:00', 'ATIVO'),
    (6, 60.00, 'Laminação de Sobrancelhas', 'Realce natural com alinhamento perfeito.', '#20B2AA', '01:00:00', 'ATIVO'),
    (6, 45.00, 'Tingimento de Sobrancelhas', 'Coloração especial para destacar as sobrancelhas.', '#FF6347', '00:30:00', 'ATIVO');