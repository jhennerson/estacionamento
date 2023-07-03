-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jul-2023 às 04:15
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

CREATE DATABASE db_parking;

USE db_parking;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_parking`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `blocos`
--

CREATE TABLE `blocos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(16) NOT NULL,
  `operador` varchar(16) NOT NULL,
  `vagas_carros` int(11) NOT NULL,
  `vagas_motos` int(11) NOT NULL,
  `vagas_deficientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blocos`
--

INSERT INTO `blocos` (`id`, `descricao`, `operador`, `vagas_carros`, `vagas_motos`, `vagas_deficientes`) VALUES
(110, 'A', 'jhennerson', 3, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `precos`
--

CREATE TABLE `precos` (
  `id` int(11) NOT NULL,
  `valor` double NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `precos`
--

INSERT INTO `precos` (`id`, `valor`, `timestamp`) VALUES
(3, 5, '2023-06-29 14:26:39'),
(11, 7, '2023-07-03 01:25:02'),
(12, 12, '2023-07-03 01:52:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(16) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `bloco` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `senha`, `bloco`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '0'),
(92, 'jhennerson', 'e10adc3949ba59abbe56e057f20f883e', 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vagas`
--

CREATE TABLE `vagas` (
  `id` int(11) NOT NULL,
  `categoria` varchar(10) NOT NULL,
  `bloco` varchar(16) NOT NULL,
  `estado` varchar(7) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vagas`
--

INSERT INTO `vagas` (`id`, `categoria`, `bloco`, `estado`, `timestamp`) VALUES
(295, 'CARRO', 'A', 'OCUPADA', '2023-07-02 22:50:15'),
(296, 'CARRO', 'A', 'LIVRE', '2023-07-02 22:50:19'),
(297, 'CARRO', 'A', 'LIVRE', '2023-07-02 22:52:30'),
(298, 'MOTO', 'A', 'LIVRE', '2023-07-02 22:50:23'),
(299, 'MOTO', 'A', 'LIVRE', '2023-07-02 22:48:23'),
(300, 'DEFICIENTE', 'A', 'LIVRE', '2023-07-02 22:23:11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `preco_hora` double NOT NULL,
  `valor` double NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `preco_hora`, `valor`, `timestamp`) VALUES
(9, 5, 392.2, '2023-07-02 09:52:47'),
(24, 7, 105.26, '2023-07-02 22:25:27'),
(28, 5, 75.01, '2023-07-02 22:50:36'),
(29, 5, 75.2, '2023-07-02 22:52:41');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `blocos`
--
ALTER TABLE `blocos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `precos`
--
ALTER TABLE `precos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `vagas`
--
ALTER TABLE `vagas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `blocos`
--
ALTER TABLE `blocos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT de tabela `precos`
--
ALTER TABLE `precos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `vagas`
--
ALTER TABLE `vagas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
