import 'package:flutter/material.dart';
import 'package:flutter_class_10/controllers/my_home_screen_controller.dart';
import 'package:flutter_class_10/models/user_model.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UserForm extends StatelessWidget {
  UserForm({
    Key? key,
    this.user,
    required this.updateMethod,
    this.edit = false,
  }) : super(key: key);

  UserModel? user;
  void Function() updateMethod;
  bool edit;
  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => FormGroup({
        'name': FormControl(
          value: user != null ? user!.name : null,
          validators: [
            Validators.required,
            Validators.minLength(3),
          ],
        ),
        'username': FormControl(
          value: user != null ? user!.username : null,
          validators: [
            Validators.required,
            Validators.minLength(5),
          ],
        ),
        'email': FormControl(
          value: user != null ? user!.email : null,
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        'phone': FormControl(
          value: user != null ? user!.phone : null,
          validators: [
            Validators.required,
            Validators.pattern(RegExp(r'(^(?:03)?[0-9]{9}$)')),
          ],
        ),
        'website': FormControl(
          value: user != null ? user!.website : null,
          validators: [
            Validators.required,
            Validators.pattern(RegExp(
                r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?")),
          ],
        ),
        "company": FormGroup({
          "name": FormControl(
            value: user != null ? user!.company?.name : null,
            validators: [
              Validators.required,
              Validators.minLength(3),
            ],
          ),
          "catchPhrase": FormControl(
            value: user != null ? user!.company?.catchPhrase : null,
            validators: [
              Validators.required,
              Validators.minLength(5),
            ],
          ),
          "bs": FormControl(
            value: user != null ? user!.company?.bs : null,
            validators: [
              Validators.required,
              Validators.minLength(5),
            ],
          ),
        }),
        'address': FormGroup({
          "street": FormControl(
            value: user != null ? user!.address?.street : null,
            validators: [
              Validators.required,
            ],
          ),
          "suite": FormControl(
            value: user != null ? user!.address?.suite : null,
            validators: [
              Validators.required,
            ],
          ),
          "city": FormControl(
            value: user != null ? user!.address?.city : null,
            validators: [
              Validators.required,
            ],
          ),
          "zipcode": FormControl(
            value: user != null ? user!.address?.zipcode : null,
            validators: [
              Validators.required,
              Validators.minLength(4),
              Validators.maxLength(5),
            ],
          ),
          "geo": FormGroup({
            "lat": FormControl(
              value: user != null ? user!.address?.geo?.lat : null,
              validators: [
                Validators.required,
              ],
            ),
            "lng": FormControl(
              value: user != null ? user!.address?.geo?.lng : null,
              validators: [
                Validators.required,
              ],
            ),
          })
        })
      }),
      builder: (context, formGroup, child) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ReactiveTextField(
                    formControlName: 'name',
                    decoration: const InputDecoration(labelText: "Enter Name"),
                    validationMessages: {
                      'required': (error) => "Name is required",
                      "minLength": (error) =>
                          "Name must be atleast 3 characters long",
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ReactiveTextField(
                    formControlName: 'email',
                    decoration: const InputDecoration(labelText: "Enter Email"),
                    keyboardType: TextInputType.emailAddress,
                    validationMessages: {
                      'required': (error) => "Email is required",
                      "email": (error) => "Invalid Email Address",
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ReactiveTextField(
                    formControlName: 'username',
                    decoration:
                        const InputDecoration(labelText: "Enter Username"),
                    validationMessages: {
                      'required': (error) => "Username is required",
                      "minLength": (error) =>
                          "Username must be atleast 5 characters long",
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ReactiveTextField(
                    formControlName: 'phone',
                    decoration:
                        const InputDecoration(labelText: "Enter Phone Number"),
                    keyboardType: TextInputType.number,
                    validationMessages: {
                      'required': (error) => "Phone is required",
                      "pattern": (error) => "Invalid Phone Number",
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ReactiveTextField(
                    formControlName: 'website',
                    decoration:
                        const InputDecoration(labelText: "Enter Website"),
                    validationMessages: {
                      'required': (error) => "Website is required",
                      "pattern": (error) => "Invalid Website",
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Address Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 5,
                        ),
                        child: ReactiveTextField(
                          formControl:
                              (formGroup.control("address") as FormGroup)
                                  .control("suite") as FormControl,
                          decoration:
                              const InputDecoration(labelText: "Enter Suite"),
                          validationMessages: {
                            'required': (error) => "Suite is required",
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 5,
                        ),
                        child: ReactiveTextField(
                          formControl:
                              (formGroup.control("address") as FormGroup)
                                  .control("street") as FormControl,
                          decoration:
                              const InputDecoration(labelText: "Enter Street"),
                          validationMessages: {
                            'required': (error) => "Street is required",
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 5,
                        ),
                        child: ReactiveTextField(
                          formControl:
                              (formGroup.control("address") as FormGroup)
                                  .control("city") as FormControl,
                          decoration: const InputDecoration(
                              labelText: "Enter City Name"),
                          validationMessages: {
                            'required': (error) => "City name is required",
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 5,
                        ),
                        child: ReactiveTextField(
                          formControl:
                              (formGroup.control("address") as FormGroup)
                                  .control("zipcode") as FormControl,
                          decoration:
                              const InputDecoration(labelText: "Enter Zipcode"),
                          validationMessages: {
                            'required': (error) => "Zipcode is required",
                            'minLength': (error) => "Invalid Zipcode",
                            'maxLength': (error) => "Invalid Zipcode",
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 5,
                        ),
                        child: ReactiveTextField(
                          formControl:
                              ((formGroup.control("address") as FormGroup)
                                      .control("geo") as FormGroup)
                                  .control("lat") as FormControl,
                          decoration: const InputDecoration(
                              labelText: "Enter Latitude"),
                          validationMessages: {
                            'required': (error) => "Latitude is required",
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 5,
                        ),
                        child: ReactiveTextField(
                          formControl:
                              ((formGroup.control("address") as FormGroup)
                                      .control("geo") as FormGroup)
                                  .control("lng") as FormControl,
                          decoration: const InputDecoration(
                              labelText: "Enter Longitude"),
                          validationMessages: {
                            'required': (error) => "Longitude is required",
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Company Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ReactiveTextField(
                    formControl: (formGroup.control("company") as FormGroup)
                        .control("name") as FormControl,
                    decoration:
                        const InputDecoration(labelText: "Enter Company Name"),
                    validationMessages: {
                      'required': (error) => "Company bs is required",
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ReactiveTextField(
                    formControl: (formGroup.control("company") as FormGroup)
                        .control("catchPhrase") as FormControl,
                    decoration: const InputDecoration(
                        labelText: "Enter Company Catch Phrase"),
                    validationMessages: {
                      'required': (error) => "Company bs is required",
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ReactiveTextField(
                    formControl: (formGroup.control("company") as FormGroup)
                        .control("bs") as FormControl,
                    decoration:
                        const InputDecoration(labelText: "Enter Company Bs"),
                    validationMessages: {
                      'required': (error) => "Company bs is required",
                    },
                  ),
                ),
                ReactiveFormConsumer(
                  builder: (buildContext, form, child) {
                    return Center(
                      child: ElevatedButton(
                          child: edit
                              ? const Text('Update User')
                              : const Text('Create User'),
                          onPressed: () {
                            if (form.valid) {
                              UserModel newUser =
                                  UserModel.fromJson(form.value);

                              if (edit) {
                                newUser.id = user!.id;
                                updateUserMethod(
                                  newUser,
                                  buildContext,
                                  updateMethod,
                                );
                              } else {
                                storeUserMethod(
                                  newUser,
                                  context,
                                  updateMethod,
                                );
                              }
                            } else {
                              form.markAllAsTouched();
                            }
                          }),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
