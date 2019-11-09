typealias FIELD = UInt8

// we have a 8x9 grid
let WIDTH = 8
let HEIGHT = 9

let EMPTY: FIELD = 0
let BALL: FIELD = 1
let PLATE: FIELD = 2


typealias BOARD = [FIELD]

func makeBoard(_ board: inout BOARD) {
    board = BOARD(repeating: EMPTY, count: WIDTH * HEIGHT)
    
    // set plate
    setPlate(&board, 4)
}

func setPlate(_ board: inout BOARD, _ middle: Int) {
    setField(&board, middle-1,   HEIGHT-1, PLATE)
    setField(&board, middle,     HEIGHT-1, PLATE)
    setField(&board, middle+1,   HEIGHT-1, PLATE)
}
func getPlate(_ board: [FIELD]) -> Int {
    var x = 0
    while getField(board, x, HEIGHT-1) != PLATE {
        x+=1
    }
    return x+1
}

func movePlateLeft(_ board: inout BOARD) {
    let middle = getPlate(board)
    if middle > 1 {
        setPlate(&board, middle-1)
        setField(&board, middle+1, HEIGHT-1, EMPTY)
    }
}

func movePlateRight(_ board: inout BOARD) {
    let middle = getPlate(board)
    if middle < WIDTH-2 {
        setPlate(&board, middle+1)
        setField(&board, middle-1, HEIGHT-1, EMPTY)
    }
}

func setField(_ board: inout BOARD, _ x: Int, _ y: Int, _ value: FIELD) {
    assert(x < WIDTH && y < HEIGHT)
    board[index(x,y)] = value
}

func getField(_ board: BOARD, _ x: Int, _ y: Int) -> FIELD {
    assert(x < WIDTH && y < HEIGHT)
    return board[index(x,y)]
}

func index(_ x: Int, _ y: Int) -> Int {
    return y * WIDTH + x
}


func getX(_ index: Int) -> Int {
    return index % WIDTH
}

func getY(_ index: Int) -> Int {
    return index / WIDTH
}

getX(0)
getX(1)
getX(2)
getX(3)
getX(4)
getX(5)
getX(6)
getX(7)
getX(8)
getX(9)
getX(10)

func nextX(_ x: Int) -> Int {
    return (x+1) % WIDTH
}

func nextY(_ y: Int) -> Int {
    return (y+1) % HEIGHT
}

nextX(0)
nextX(1)
nextX(2)
nextX(3)
nextX(4)
nextX(5)
nextX(6)
nextX(7)
nextX(8)
nextX(9)
nextX(10)
nextX(11)
nextX(12)

var x = 0
var y = 0
func draw(_ board: inout BOARD) {
    
    board[index(x, 1)] = 0
    x = nextX(x)
    board[index(x, 1)] = 5
    
    board[index(2, y)] = 0
    y = nextY(y)
    board[index(2, y)] = 7
    
    var out: String = ""
    for y in 0..<HEIGHT {
        for x in 0..<WIDTH {
            out.append("\(getField(board, x, y)) ")
        }
        out.append("\n")
    }
    print(out)
}




var board: BOARD = BOARD()
makeBoard(&board)

draw(&board)
movePlateLeft(&board)
draw(&board)
movePlateLeft(&board)
draw(&board)
movePlateLeft(&board)
draw(&board)
movePlateLeft(&board)
draw(&board)
movePlateRight(&board)
draw(&board)
movePlateRight(&board)
draw(&board)
movePlateRight(&board)
draw(&board)
movePlateRight(&board)
draw(&board)
movePlateRight(&board)
draw(&board)
movePlateRight(&board)
draw(&board)
movePlateRight(&board)
draw(&board)
