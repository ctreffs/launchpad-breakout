typealias FIELD = UInt8

// we have a 8x9 grid
let WIDTH = 8
let HEIGHT = 9

let EMPTY: FIELD = 0
let BALL: FIELD = 1
let PLATE: FIELD = 2

func makeBoard(_ board: inout [FIELD]) {
    board = [FIELD](repeating: EMPTY, count: WIDTH * HEIGHT)
    
    // set plate
    setPlate(&board, 4)
}

func setPlate(_ board: inout [FIELD], _ middle: Int) {
    setField(&board, middle-1,   HEIGHT-1, PLATE)
    setField(&board, middle,     HEIGHT-1, PLATE)
    setField(&board, middle+1,   HEIGHT-1, PLATE)
}
func getPlate(_ board: [FIELD], _ middle: inout Int) {
    var x = 0
    while getField(board, x, HEIGHT-1) != PLATE {
        x+=1
    }
    middle = x+1
}

func movePlateLeft(_ board: inout [FIELD]) {
    var middle = -1
    getPlate(board, &middle)
    if middle > 1 {
        setPlate(&board, middle-1)
        setField(&board, middle+1, HEIGHT-1, EMPTY)
    }
}

func movePlateRight(_ board: inout [FIELD]) {
    var middle = -1
    getPlate(board, &middle)
    if middle < WIDTH-2 {
        setPlate(&board, middle+1)
        setField(&board, middle-1, HEIGHT-1, EMPTY)
    }
}

func setField(_ board: inout [FIELD], _ x: Int, _ y: Int, _ value: FIELD) {
    assert(x < WIDTH && y < HEIGHT)
    let idx = y * WIDTH + x
    board[idx] = value
}

func getField(_ board: [FIELD], _ x: Int, _ y: Int) -> FIELD {
    assert(x < WIDTH && y < HEIGHT)
    let idx = y * WIDTH + x
    return board[idx]
}

func draw(_ board: [FIELD]) {
    var out: String = ""
    for y in 0..<HEIGHT {
        for x in 0..<WIDTH {
            out.append("\(getField(board, x, y)) ")
        }
        out.append("\n")
    }
    print(out)
}


var board: [FIELD] = [FIELD]()
makeBoard(&board)

draw(board)
movePlateLeft(&board)
draw(board)
movePlateLeft(&board)
draw(board)
movePlateLeft(&board)
draw(board)
movePlateLeft(&board)
draw(board)
movePlateRight(&board)
draw(board)
movePlateRight(&board)
draw(board)
movePlateRight(&board)
draw(board)
movePlateRight(&board)
draw(board)
movePlateRight(&board)
draw(board)
movePlateRight(&board)
draw(board)
movePlateRight(&board)
draw(board)
