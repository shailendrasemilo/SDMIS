import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CommonDashComponent } from './common-dash.component';

describe('CommonDashComponent', () => {
  let component: CommonDashComponent;
  let fixture: ComponentFixture<CommonDashComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CommonDashComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CommonDashComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
