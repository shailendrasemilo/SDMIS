import { Directive, ElementRef, HostListener } from '@angular/core';

@Directive({
  selector: '[appCharacterOnly]'
})
export class CharacterOnlyDirective {

  constructor(private el: ElementRef) { }

  @HostListener('input', ['$event']) onInputChange(event) {
    const initalValue = this.el.nativeElement.value;
    this.el.nativeElement.value = initalValue.replace(/[^A-Za-z]*/g, '');
  }
}
