import { apiInitializer } from "discourse/lib/api";
import { getOwner } from "discourse-common/lib/get-owner";

export default apiInitializer("0.11.1", api => {
  api.registerConnectorClass("about-after-description", "contact-info", {
    setupComponent(args, component) {
      const aboutController = getOwner(this).lookup("controller:about");
      component.set("contactInfo", aboutController?.contactInfo);
    }
  });
});
