import { PrimaryColumn, Column, Entity, Unique, ManyToOne } from 'typeorm';
import { Key } from './key';

@Entity({ name: 'Note' })
@Unique(["note"])
export class Note {
  @PrimaryColumn()
  public note!: Buffer;

  @Column()
  public blockNum!: number;

  @Column()
  public nullifier!: boolean;

  @ManyToOne(type => Key, key => key.id)
  public owner!: string;
}