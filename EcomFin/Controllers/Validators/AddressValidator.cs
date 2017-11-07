using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers.Validators {
    public class AddressValidator: AbstractValidator<Address> {
        public AddressValidator() {
            RuleFor(a => a.LineOne).NotEmpty();
            RuleFor(a => a.Street).NotEmpty();
            RuleFor(a => a.City).NotEmpty();
            RuleFor(a => a.State).NotEmpty();
            RuleFor(a => a.Country).NotEmpty();
            RuleFor(a => a.ZIP).NotNull().Matches("^[0-9]{6}$");
        }
    }
}