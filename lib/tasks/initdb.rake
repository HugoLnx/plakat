desc "initialize db"
task initdb: :environment do
  posters_info = [
    {
      description: %q{Pós-MBA – A Escola de Negócios oferece o curso Pós-MBA em Reestruturações e Saneamentos Empresariais. As inscrições podem ser feitas pelo site www.iag.puc-rio.br. Mais informações pelo e-mail institucional@iag.puc-rio.br ou pelo telefone 2138-9240.
    MBA – Estão abertas as inscrições para os cursos de MBA em Management, Marketing, Recursos Humanos, Gerenciamento de Projetos, Finanças Corporativas, Gestão Comercial e de Vendas, e Gestão de Investimentos da Escola de Negócios da PUC-Rio (IAG). As aulas começam em abril de 2015. Para inscrições feitas até o dia 31 de janeiro os candidatos terão 10% de desconto. Mais informações: www.iag.puc-rio.br ou 2138-9240.}
    },

    {
     title: "Noruega",
     description: %q{Estão abertas, até o dia 1º de fevereiro, as inscrições para os cursos de verão da Universidade de Oslo, na Noruega, com oportunidade de bolsa de estudo. Os cursos são oferecidos em inglês, durante o período de 22 de junho a 31 de julho de 2015. A bolsa, no valor de $ 3.965, cobre gastos com o curso, acomodação, alimentação excursões e seguro de saúde. Os interessados devem consultar o site www.puc-rio.br/ensinopesq/ccci/opostunidade_exterior.html.}
   },

   {
     title: "Cursos CCE",
     description: %q{Silk-screen – Técnicas Manuais para Geração de Texturas Criativas – Aulas aos sábados, das 8h às 12h, no campus Gávea, de 10 de janeiro a 7 de fevereiro (curso de férias). Inscrições até dia 5 de janeiro. Matemática Financeira com Aplicações à Análise de Investimentos – Aulas às segundas-feiras , das 19h às 22h, no campus Gávea, de 19 de janeiro a 20 de abril. Inscrições até 12 de abril. Informações: www.cce.puc-rio.br ou 0800 970 9556.}
    },

    {
      title: "MEDPUC",
      description: %q{Estão abertas as inscrições para o curso de Formação Docente em Medicina e Ciências da Saúde do Departamento de Medicina da PUC-Rio (MEDPUC). O curso é destinado a médicos e profissionais das áreas de saúde, com no mínimo três anos de formados. As aulas começam no dia 2 de março, com previsão de término para junho de 2016, e serão ministradas na Casa da Medicina da PUC-Rio, na Estrada da Gávea, nº 36. Os interessados podem se inscrever até o dia 12 de janeiro, pelo site www.ccbs.puc-rio.br.}
    },

    {
      title: "No Exterior",
      description: %q{Chamada para a seleção de propostas de seminários virtuais de pós-graduação, que serão realizados no segundo semestre de 2015, divulgada pelo Conselho Latino-Americano de Ciências Sociais (CLACSO). Os temas serão: Cátedra Florestán Fernandes: sobre Pensamiento social latino-americano; Cátedra Orlando Fals Borda: sobre Metodología de la investigación social; Cátedra Sur-Sur: sobre Estudios Sur-Sur. Inscrições até 15 de fevereiro de 2015.}
    },

    {
      description: %q{Bolsa de pós-doutorado Mellon Postdoctoral Fellowship in Latin American/Brazilian Art/Architeture divulgado pelo Cogut Center for the Humanities, da Brown University. Os interessados podem se inscrever até o dia 15 de janeiro de 2015.

  No Brasil
  * As inscrições para o Edital Faperj Nº 46/2014 vão até o dia 26 de fevereiro. O projeto é uma parceria do CNPq com a Faperj e seleciona trabalhos no âmbito do Programa de Apoio a Núcleos de Excelência – PRONEX – 2013.

  * Segunda-feira, 5, 10h, miniauditório do RDC – Dormitório urbano: Uma problemática social (in)sustentável - A rua como espaço de morar na cidade do Rio de Janeiro, por Ricardo Manuel Berto Saldanha, candidato ao título de Mestre em Engenharia Urbana e Ambiental (opção profissional), Área de Concentração: Engenharia Urbana e Ambiental. Orientador:
  professor Hugo Miguel Varela Repolho.

  * Segunda-feira, 5, 18h, sala 304-L - O Tratamento Mecânico e Biológico na Gestão de Resíduos no Município do Rio de Janeiro, por Jussara Oliveira do Nascimento, candidata ao título de Mestre em Engenharia Urbana e Ambiental (opção profissional), Área de Concentração: Engenharia Urbana e Ambiental. Orientador: professora Ana Cristina Malheiros Gonçalves Carvalho.

  * Quinta-feira, 8, 14h, miniauditório do RDC - A apropriação do verde e o discurso da “consciência ecológica” na comercialização dos empreendimentos na região da Barra da Tijuca: Um caminho oposto à sustentabilidade, por Eduarda Ramalho Dôce, candidata ao título de Mestre em Engenharia Urbana e Ambiental (opção profissional), Área de
  Concentração: Engenharia Urbana e Ambiental. Orientador: professora
  Maria Fernanda Rodrigues Campos Lemos.

  * Sábado, 10, 14h, 511- RDC - Early Vulnerability Detection for Supporting Secure Programming, por Luciano Sampaio Martins de Souza, candidato ao título de Mestre em Informática, Área de Concentração: Engenharia de Software. Orientador: professor Alessandro Fabricio Garcia.

  * Sexta-feira, 9, 14h, sala 649-L - Biossensor e Dispositivo Eletro-Óptico em Fibras Ópticas Especiais, por Alexandre de Resende Camara, candidato ao título de Doutor em Ciências - Física, Área de Concentração: Óptica. Orientador: professora Isabel Cristina dos Santos Carvalho}
    }
  ]

  5.times do |i|
    posters_info.each.with_index do |info, j|
      poster_index = (i - 1) * posters_info.size + j
      info_title = info[:title] && "#{poster_index} - #{info[:title]}"
      p = Poster.new(title: info_title, description: info[:description], disabled: false, date_event: (DateTime.now + 3*(j+10).days), date_expiration: (DateTime.now + 30.days))
      if poster_index < 20
        p[:ref_imagem] = "imagem#{poster_index}.jpg"
      end
      p.save!
      #Poster(id: integer, title: string, description: text, date_event: date, ref_imagem: string, date_expiration: date, disabled: boolean, cause_blockage: text, theme: string, visibility_title: boolean, visibility_description: boolean, visibility_date_event: boolean, created_at: datetime, updated_at: datetime)
    end
  end
end

desc "download images"
task downloadimg: :environment do
  img = ARGV[1]
  begin;Dir.mkdir("./public/uploaded_posters/"); rescue;end
  #images = Poster.all.map{|p| p[:ref_imagem]}
  Dir.chdir "public/uploaded_posters"
    `wget https://plakat.s3.amazonaws.com/uploaded_posters/imagem#{img}.jpg &`
    `wget https://plakat.s3.amazonaws.com/uploaded_posters/small_imagem#{img}.jpg &`
    `wget https://plakat.s3.amazonaws.com/uploaded_posters/large_imagem#{img}.jpg &`
end

desc "set random categories"
task set_categories: :environment do
  categories = %w{Design Informática UFC Big\ Brother\ Brasil Categoria\ 1 Categoria\ 2 Categoria\ 3}.map do |name|
    c = Category.find_or_initialize_by(name: name)
    c.disabled = false
    c.dt_creation = DateTime.now
    c.save!
    c
  end


  Poster.all.each do |poster|
    poster.categories = categories.sample(Random.rand(categories.size+1))
    poster.save!
  end
end
