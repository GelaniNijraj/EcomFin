using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers.Validators {
    public class AdminValidator: AbstractValidator<Admin> {
        public AdminValidator() {
            RuleFor(a => a.Username).NotEmpty();
            RuleFor(a => a.Password).NotEmpty().MinimumLength(4);
        }
    }
}