using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers.Validators {
    public class CustomerValidator: AbstractValidator<Customer> {
        public CustomerValidator() {
            RuleFor(c => c.Name).NotEmpty();
            RuleFor(c => c.Password).NotEmpty().MinimumLength(6);
            RuleFor(c => c.Email).NotEmpty().EmailAddress();
        }
    }
}