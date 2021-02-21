type StudentRoster = Map<string, string[]>

export default class GradeSchool {
  private roster: StudentRoster;

  constructor() {
    this.roster = new Map<string, string[]>();
  }

  studentRoster() {
    return new Map([...this.roster.entries()].sort());
  }

  studentsInGrade(grade: number) {
    let key = grade.toString()
    return this.roster.has(key) ? this.roster.get(key)?.sort() : []
  }

  // my implementation
  addStudent(name: string, grade: number) {
    let key = grade.toString()

    if(this.roster.has(key)) {
      let students = this.roster.get(key)

      if (students?.includes(name) === true) {
        return
      } else {
        students?.push(name)
        students?.sort()
      }
    } else {
      this.roster.set(key, [name])
    }
  }
}