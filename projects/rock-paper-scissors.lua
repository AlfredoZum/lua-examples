local handleInput = function(options)
  local input
 repeat input = io.read() until options[input]

 return options[input]()
end

local resultGame = function (player, player2)
  if player == 1 then
    if( player2 == 2 ) then
      return 2;
      -- print('Perdiste, el papel le gana a la piedra :(');
    elseif player2 == 3 then
      return 1;
      -- print('Ganaste, la piedra le gana a las tijeras :)');
    else
      return 0;
      -- print('Empate, los dos elegieron piedra :|');
    end
  elseif player == 2 then
    if( player2 == 1 ) then
      return 1;
      -- print('Ganaste, el papel le gana a la piedra :)');
    elseif player2 == 3 then 
      return 2;
      -- print('Perdiste, las tijeras le ganan al papel :(');
    else
      return 0;
      -- print('Empate, los dos elegieron papel :|');
    end
  else
    if( player2 == 1 ) then
      return 2;
      -- print('Perdiste, la piedra le gana a las tijeras :(');
    elseif player2 == 2 then
      return 1;
      -- print('Ganaste, las tijeras le gana al papel :)');
    else
      return 0;
      -- print('Empate, los dos elegieron tijeras :|');
    end
  end
end

local resultGameTwoPlayer = function (player, player2)
  os.execute('clear');
  local win = resultGame(player, player2);
  if win == 1 then
    print('El jugador 1 gano!!' );
  elseif win == 2 then
    print('El jugador 2 gano!!');
  else
    print('Empate !!');
  end
  print('\n\n');

  PlayerMenu();
end

local showOptions = function ()
  io.write( "Juego de piedra, papel o tijeras!!\n\n" );

  io.write( "[1]	Piedra\n" );
  io.write( "[2]	Papel\n" );
  io.write( "[3]	Tijeras\n\n" );
end

local twoPlayer = function()
  os.execute("clear")
  showOptions()

  io.write( "Jugador uno escoja una opcion\n" );
  local player1 = io.read( "*n" );

  io.write( "Jugador dos escoja una opcion\n" );
  local player2 = io.read( "*n" );
  resultGameTwoPlayer(player1, player2);
end

local IAPlayer = function()
  os.execute("clear")
  showOptions()

  io.write( "Escoja una opcion\n" );
  local player1 = io.read( "*n" );

  local player2 = math.random(3);

  resultGameTwoPlayer(player1, player2);
end

function PlayerMenu()
  print("[1] two player")
  print("[2] player vs IA")
  print("[x] exit")

  return handleInput {
    ['1'] = twoPlayer,
    ['2'] = IAPlayer,
    ['x'] = os.exit,
  }
end

function Main()
  PlayerMenu();
end

Main();