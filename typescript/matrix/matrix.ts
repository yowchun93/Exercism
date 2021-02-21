class Matrix {
  public rows: Array<Array<number>>;
  public columns: Array<Array<number>>;

  constructor(matrix: string) {
    this.rows    = []
    this.columns = [[], [], []]
    this.initializeMatrix(matrix)
  }

  initializeMatrix(matrix: string) {
    matrix.split("\n").forEach((row: string) => {
      let newRow: number[] = []

      row.split(' ').forEach((elem, index) => {
        newRow.push(parseInt(elem))
        this.addColumn(parseInt(elem), index)
      })

      this.rows.push(newRow)
    })
  }

  addColumn(elem: number, index: number) {
    this.columns[index].push(elem)
  }
}

export default Matrix
