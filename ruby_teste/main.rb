$bagmon = ['Pfizegator', 'Zégoti', 'Pequemico', 'Ararazul', 'Capi']
$lifeBagmon1 = 100
$lifeBagmon2 = 100
$choice1
$choice2
$randAttack
$turn = 1

def listBagmon
  puts "\nDe 0 a 4 escolha o seu Bagmon da lista abaixo: \n\n"
  $bagmon.each do |list|
    puts ($bagmon.index list).to_s + ' ' + list
  end
end

def battle
  
end

def war(choice1, choice2)
  bagmons = [$bagmon[choice1], $bagmon[choice2]]
  randSelected = rand(0..1)
  randAttacker = attack


  puts "\nOs bagmons escolhidos são:"
  puts "1 - " + $bagmon[choice1]
  puts "2 - " + $bagmon[choice2]

  puts
  puts "Pressione enter para iniciar o turno"
  gets
  puts "O valor do ataque é: " + randAttacker.to_s

  
  puts "\n\n -----Turno " + $turn.to_s + "----- \n\n"
  puts "É a vez de " + bagmons[randSelected] + " atacar!"
  puts

  if bagmons[randSelected] == $bagmon[choice1]
    $lifeBagmon2 = $lifeBagmon2 - randAttacker
  end

  if bagmons[randSelected] == $bagmon[choice2]
    $lifeBagmon1 = $lifeBagmon1 - randAttacker
  end

  puts "Pressione enter para finalizar o turno"
  gets
  
  puts "Após o turno a vida de cada bagmon é:"
  puts  $bagmon[choice1] + ': ' + $lifeBagmon1.to_s
  puts  $bagmon[choice2] + ': ' + $lifeBagmon2.to_s

  if $lifeBagmon1 <= 0 and $lifeBagmon2 > 0
    puts "\nO vencedor é: " + $bagmon[$choice2]
    elsif $lifeBagmon2 <= 0 and $lifeBagmon1 > 0
    puts "\nO vencedor é: " + $bagmon[$choice1]
  else
    puts
  end
end

def attack
  $randAttack = rand(1..10)
  return $randAttack
end

loop do
  puts "\nSelecione uma das opções abaixo:"
  puts '1 - Escolher Bagmon 1'
  puts '2 - Escolher Bagmon 2'
  puts '3 - Batalhar'
  puts '4 - Sair'
  puts "\n"
  
  escolha = gets.to_i

  case escolha
  when 1
    listBagmon
    $choice1 = gets.to_i
  when 2
    listBagmon
    $choice2 = gets.to_i
  when 3
    while $lifeBagmon1 and $lifeBagmon2 > 0
      war($choice1, $choice2)
      $turn = $turn + 1
    end
  end
  break if gets.chomp.to_i == 4
end
