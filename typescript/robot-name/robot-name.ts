export default class Robot {
  private static seenNames: Set<string> = new Set();
  public name: string;

  constructor() {
    this.name = Robot.generateName();
    Robot.seenNames.add(this.name);
  }

  private static randomDigit(): number {
    return Math.floor(Math.random() * Math.floor(1000));
  }

  private static randomLetter(): string {
    let letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
    return letters[Math.floor(Math.random() * letters.length)];
  }

  // Refer to how setter and getter works again.
  // public set name(name: string) {
  //   this.name = name
  // }

  // public get name(): string {
  //   return this.name
  // }

  public static generateName(): string {
    let name = `${Robot.randomLetter()}${Robot.randomLetter()}${('000' + Robot.randomDigit()).substr(-3)}`;

    if (Robot.seenNames.has(name)){
      return this.generateName();
    } else {
      return name
    }
  }

  public resetName(): void {
    this.name = Robot.generateName();
    Robot.seenNames.add(this.name);
  }

  public static releaseNames(): void {
    this.seenNames = new Set();
  }
}
