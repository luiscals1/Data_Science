# Maratona de Dados Falqon

### Neste projeto desenvolvido durante a Maratona de Dados Falqon, foi efetadas etapas de um projeto real de Data Science, usando dados de uma rede de lojas durante o ETL, e dados do mercado de ações do Google para realização de predição dos valores dessas ações

<p align="center">
  <img src="https://github.com/luiscals1/Data_Science/blob/main/Maratona-de-Dados-Falqon/documention/logoFalqon.jpg">
</p>

<p align="center">
  <img src="https://img.shields.io/static/v1?label=Status&message=Documenta%C3%A7%C3%A3o%20em%20Andamento&color=green&style=for-the-badge"/>
</p>

## ETL
Após definição dos indicadores e dimensões, deve-se mapear quais serão as fontes de dados e tratamentos a serem realizados para implementação do processo de ETL.

<p align="center">
  <img src="https://github.com/luiscals1/Data_Science/blob/main/Maratona-de-Dados-Falqon/documention/etl/project_etl.jpg"/>
</p>

# Transformação dos dados
 Após configuração das etapas de input e output, pode-se executar o processo de transformação.

<p align="center">
  <img src="https://github.com/luiscals1/Data_Science/blob/main/Maratona-de-Dados-Falqon/documention/etl/transformation_venda.jpg"/>
</p>
 
# Jobs ou Tasks
Agendamento e execução das transformações
Os Jobs ou tasks, dependendo da ferramenta, são os componentes responsáveis por organizar a execução dos processos de transformação, configurando os agendamentos, reports, monitoramentos entre outras informações.

<p align="center">
  <img src="https://github.com/luiscals1/Data_Science/blob/main/Maratona-de-Dados-Falqon/documention/etl/job_VendaStage.jpg"/>
</p>


# Criação da fato de venda e custo
Criação do processo de transformação
A partir das tabelas <b>kronos_stage.venda_loja_produto e kronos.custo</b> serão executadas as devidastransformações para preencher a tabela destino <b>kronos_dw.fato_venda_custo</b>.

<div align="center">
  <h3> FatoVendaCusto </h3>
</div>
 
  <p align="center">
    <img src="https://github.com/luiscals1/Data_Science/blob/main/Maratona-de-Dados-Falqon/documention/etl/transformation_FatoVendaCusto.jpg"/>
  </p>

<div align="center">
  <h3> DimLoja </h3>
</div>
   
  <p align="center">
    <img src="https://github.com/luiscals1/Data_Science/blob/main/Maratona-de-Dados-Falqon/documention/etl/transformation_DimLoja.jpg"/>
  </p>
  
  
## Serviços prestados
* Banco de Dados
* Criação de ETL
* Visualização de Dados
* Análise de Dados
* Modelagem Preditiva

## Tecnologias Abordadas

* SQL 
* Pentaho
* Power BI: [App Powe BI](https://cutt.ly/vendas-power-bi-dashboard)
* Python
* Análise de Dados
* Machine Learning: [Notebook](https://cutt.ly/vendas-power-bi-dashboard)
