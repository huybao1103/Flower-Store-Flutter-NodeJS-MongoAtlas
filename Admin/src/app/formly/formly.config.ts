import { ConfigOption } from "@ngx-formly/core";
import { FormlyFieldInput } from "./type/input.type";
import { FormlyFieldNgSelect } from "./type/ng-select.type";
import { FormlyFieldCheckbox } from "./type/checkbox.type";
import { FormlyFieldDateTime } from "./type/datetime-picker.type";
import { FormlyFieldInputPassword } from "./type/input-password.type";
import { FormlyFieldTextArea } from "./type/text-area.type";

export const FORMLY_INPUT = {
    name: 'input-text',
    component: FormlyFieldInput,
    wrappers: ['form-field']
};

export const FORMLY_INPUT_PASSWORD = {
  name: 'input-password',
  component: FormlyFieldInputPassword,
  wrappers: ['form-field']
};

export const FORMLY_SELECT = {
  name: 'select',
  component: FormlyFieldNgSelect,
  wrappers: ['form-field']
};

export const FORMLY_CHECKBOX = {
  name: 'check-box-control',
  component: FormlyFieldCheckbox,
  wrappers: ['form-field']
};

export const FORMLY_DATETIME_PICKER = {
  name: 'date-time',
  component: FormlyFieldDateTime,
  wrappers: ['form-field']
};

export const FORMLY_TEXT_AREA = {
  name: 'text-area',
  component: FormlyFieldTextArea,
  wrappers: ['form-field']
};

export const FORMLY_CONFIG: ConfigOption = {
    types: [
      FORMLY_INPUT,
      FORMLY_SELECT,
      FORMLY_CHECKBOX,
      FORMLY_DATETIME_PICKER,
      FORMLY_INPUT_PASSWORD,
      FORMLY_TEXT_AREA
    ],
    validators: [],
    validationMessages: [],
  };