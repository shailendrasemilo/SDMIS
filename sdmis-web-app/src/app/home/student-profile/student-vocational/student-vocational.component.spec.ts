import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentVocationalComponent } from './student-vocational.component';

describe('StudentVocationalComponent', () => {
  let component: StudentVocationalComponent;
  let fixture: ComponentFixture<StudentVocationalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StudentVocationalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StudentVocationalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
