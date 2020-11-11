import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentIncentiveComponent } from './student-incentive.component';

describe('StudentIncentiveComponent', () => {
  let component: StudentIncentiveComponent;
  let fixture: ComponentFixture<StudentIncentiveComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StudentIncentiveComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StudentIncentiveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
