import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NumberOnlyDirective } from '../number-only.directive';
import { CharacterOnlyDirective } from '../character-only.directive';

@NgModule({
  declarations: [ NumberOnlyDirective, CharacterOnlyDirective ],
  imports: [
    CommonModule
  ],
  exports: [ NumberOnlyDirective, CharacterOnlyDirective ]
})
export class DirectiveModule { }
