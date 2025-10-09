import Component from "@ember/component";
import { getOwner } from "@ember/owner";
import { htmlSafe } from "@ember/template";
import { classNames, tagName } from "@ember-decorators/component";
import icon from "discourse/helpers/d-icon";
import { i18n } from "discourse-i18n";

@tagName("section")
@classNames("about-after-description-outlet", "contact-info")
export default class ContactInfo extends Component {
  init() {
    super.init(...arguments);
    const aboutController = getOwner(this).lookup("controller:about");
    this.set("contactInfo", aboutController?.contactInfo);
  }

  <template>
    {{#if this.contactInfo}}
      <section class="about contact contact-custom">
        <h3>{{icon "far-envelope"}} {{i18n "about.contact"}}</h3>
        <p>{{htmlSafe this.contactInfo}}</p>
      </section>
    {{/if}}
  </template>
}
