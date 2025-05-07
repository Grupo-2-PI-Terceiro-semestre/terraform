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

INSERT INTO endereco (bairro, cep, cidade, complemento, estado, logradouro, numero, latitude, longitude) VALUES
('Cerqueira César', '01414-905', 'São Paulo', '', 'SP', 'Rua Haddock Lobo', '1000', '-23.5605724', '-46.6644755'),
('Bela Vista', '01310-300', 'São Paulo', 'de 2134 ao fim - lado par', 'SP', 'Avenida Paulista', '2202', '-23.5575252', '-46.66038169999999'),
('Jardim Record', '06784-210', 'Taboão da Serra', '', 'SP', 'Rua João Pereira dos Santos', '123', null, null),
('Cerqueira César', '01413-000', 'São Paulo', 'de 1681 a 2429 - lado ímpar', 'SP', 'Rua Augusta', '1801', '-23.558713', '-46.6606999'),
('Cerqueira César', '01418-200', 'São Paulo', 'de 2154 ao fim - lado par', 'SP', 'Alameda Santos', '2300', '-23.5582822', '-46.6617526'),
('Cerqueira César', '01418-200', 'São Paulo', 'de 2154 ao fim - lado par', 'SP', 'Alameda Santos', '2335', '-23.5581665', '-46.6625583'),
('Bela Vista', '01310-200', 'São Paulo', 'de 1512 a 2132 - lado par', 'SP', 'Avenida Paulista', '1710', '-23.5605266', '-46.65700469999999'),
('Cerqueira César', '01414-000', 'São Paulo', 'até 1048 - lado par', 'SP', 'Rua Haddock Lobo', '614', '-23.5579233', '-46.6620658'),
('Trindade', '88036-000', 'Florianópolis', 'Cobertura', 'SC', 'Rua Lauro Linhares', '890', null, null),
('Meireles', '60160-150', 'Fortaleza', 'Apartamento 802', 'CE', 'Av. Beira Mar', '555', null, null),
('Vila Mariana', '04018-001', 'São Paulo', 'Sala 204', 'SP', 'Rua Vergueiro', '1001', null, null);



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


INSERT INTO usuarios(fk_empresa, fk_endereco, representante, tipos_de_usuario, cpf, email_pessoa,
                     firebase_uid, fk_funcao, nome_pessoa, numero_telefone, senha, status_atividade) VALUES
    (2, 2, 1, 0, '12345678901', 'admin@belezaexpress.com', '', 1, 'Administrador Belezza Express', NULL,
     '$2a$10$jTFvRNxv.JBvUvLtCFSeR.UY2O/ugXv.kKYOIuKnwz4GgHKxzRIN.', 'ATIVO'),
    (3, 3, 1, 0, '12345678902', 'admin@barberking.com', '', 1, 'Administrador Barber King', NULL,
     '$2a$10$jTFvRNxv.JBvUvLtCFSeR.UY2O/ugXv.kKYOIuKnwz4GgHKxzRIN.', 'ATIVO'),
    (4, 4, 1, 0, '12345678903', 'admin@topmanicure.com', '', 1, 'Administrador Top Manicure', NULL,
     '$2a$10$jTFvRNxv.JBvUvLtCFSeR.UY2O/ugXv.kKYOIuKnwz4GgHKxzRIN.', 'ATIVO')